from robot.api import logger
from robot.libraries.OperatingSystem import OperatingSystem
from robot.libraries.BuiltIn import BuiltIn
import os.path
from math import ceil
from io import StringIO
import subprocess
import json
import csv
import sys

PROGRESS_FREQUENCY = 0.1

class UsercubeRobotFramework(object):
    json_input = None
    ROBOT_LISTENER_API_VERSION = 2

    def __init__(self):
        self.ROBOT_LIBRARY_LISTENER = self

    def _end_keyword(self, name, attrs):
        if attrs['status'] == 'FAIL':
            self.log_debug(f"Keyword {name} failed.")

    def fulfill_robotframework(self, orders_path, result_file_path, runtime_path):
        self.orders_path = orders_path
        self.result_file_path = result_file_path
        """Fulfill changes in external system by processing orders. Start by creating a result file to fill it incrementally"""
        if not runtime_path:
            runtime_path = os.path.dirname(os.path.abspath(__file__))
        self.runtime_path = runtime_path

        encrypt_exe_path = self._prepare_encryption()

        try:
            with subprocess.Popen([encrypt_exe_path, "-o", result_file_path], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, encoding="utf-8-sig") as proc:
                self._add_result_header(proc.stdin)
                self._process_orders(proc.stdin)

                output, err = proc.communicate()
                # Usercube-Encrypt-File.exe writes errors in the output stream
                if output:
                    raise Exception(f"Error while encrypting result file {output}")
        except Exception as e:
            self.log_error(str(e))
            raise e

    def _prepare_encryption(self):
        """Build exe path for encryption of result file"""
        encrypt_exe_path = OperatingSystem().join_path(self.runtime_path,"Usercube-Encrypt-File.exe")
        if not os.path.isfile(encrypt_exe_path):
            self.log_error(f"File {encrypt_exe_path} does not exist")
            raise

        return encrypt_exe_path

    def _add_result_header(self, stream):
        """Add header to process' stdin"""
        results = [["AssignmentId", "ProvisioningState", "Message", "ChangeType"]]
        result_content = self._create_result_csv(results)
        stream.write(result_content)

    def _process_orders(self, stream):
        """Execute user defined operations on orders"""
        orders_files = self._fetch_provisioning_orders()
        for orders_file in orders_files:
            try:
                orders = self._load_json_provisioning_orders(orders_file)
            except Exception as e:
                error_message = f"Error while loading file {OperatingSystem().join_path(self.orders_path, orders_file)}"
                self.log_debug(f'{error_message}: {str(e)}')
                raise Exception(error_message) from e

            try:
                self._move_file_completed( orders_file)
            except Exception as e:
                error_message = f'The file {OperatingSystem().join_path(self.orders_path, orders_file)} could not be moved'
                self.log_debug(f'{error_message}: {str(e)}')
                raise Exception(f'{error_message}.') from e

            self._log_message(f"OrdersCount: {str(len(orders))}")
            errored = 0
            results = []
            ratio = ceil(len(orders) * PROGRESS_FREQUENCY)
            for count, order in enumerate(orders):
                errored = self._evaluate_progress(count, ratio, len(orders), errored)
                self.needs_notification = False
                self.try_failed = False
                self.current_resource_type_id = order['ResourceType']['Id']
                self.execution_id = order['AssignedResourceTypeId']
                self.password = ""
                execution_type = order['ChangeType']
                execution_state = 'Executed'
                execution_message = ''

                if execution_type == 'Added':
                    keyword = 'ExecuteAdd'
                elif execution_type == 'Deleted':
                    keyword = 'ExecuteDelete'
                elif execution_type == 'Modified':
                    keyword = 'ExecuteModify'
                else:
                    keyword = 'Unknown'

                status, error = BuiltIn().run_keyword_and_ignore_error(keyword, order)

                if self.needs_notification :
                    self._log_message("Password notification was not sent by the script. Automatically sending notification as a backup.")
                    self.send_password_notification()

                if (status == 'FAIL'):
                    execution_state = 'Errored'
                    execution_message = "Executing command %s failed: %s" % (keyword, error)
                    self._log_message(f'Executing order: {self.execution_id} ChangeType: {execution_type}')
                    self.log_error(execution_message)
                    errored += 1

                results.append([self.execution_id, execution_state, execution_message, execution_type])

            result_content = self._create_result_csv(results)
            stream.write(result_content)

    def _fetch_provisioning_orders(self):
        """Return the filenames of the provisioning orders"""
        orders_files = OperatingSystem().list_files_in_directory(self.orders_path, "*.json")
        return orders_files

    def _load_json_provisioning_orders(self, orders_file):
        """Decrypt the JSON file if needed and return the provisioning orders list"""
        orders_file_path = OperatingSystem().join_path(self.orders_path, orders_file)
        orders_block = self._decrypt_json_file(orders_file_path)
        orders = orders_block["ProvisioningOrdersList"]
        return orders

    def _evaluate_progress(self, index, ratio, order_count, errored):
        """Compute progress of the orders processing"""
        if (int(index+1) % ratio) == 0:
            self._log_message(f"Progress:{str(ratio - errored)}")
            errored = 0
        elif (int(index+1) % ratio) != 0 and (int(index+1) == order_count):
            self._log_message(f"Progress:{str(int(index+1) % ratio)}")
            errored = 0

        return errored

    def _move_file_completed(self, orders_file):
        """Move completed file to the Completed directory"""
        orders_file_path = OperatingSystem().join_path(self.orders_path, orders_file)
        completed_orders_path = OperatingSystem().join_path(self.orders_path, "Completed")
        OperatingSystem().create_directory(completed_orders_path)
        OperatingSystem().move_file(orders_file_path, completed_orders_path)

    def _create_result_csv(self, results):
        """Return a CSV string based on the results list"""
        csv_content = StringIO()
        writer = csv.writer(csv_content, delimiter =',', quoting=csv.QUOTE_ALL, lineterminator='\n')
        for result in results:
            writer.writerow(result)
        return csv_content.getvalue()

    def _decrypt_json_file(self, orders_file_path):
        """Return the content of the JSON file after decryption"""
        decrypt_exe_path = OperatingSystem().join_path(self.runtime_path,"Usercube-Decrypt-File.exe")
        if not os.path.isfile(decrypt_exe_path):
            raise Exception(f"File {decrypt_exe_path} does not exist")
        proc = subprocess.run([decrypt_exe_path, "-f", orders_file_path], capture_output=True, encoding="utf-8-sig")
        try:
            json_file_content = json.loads(proc.stdout)
        except json.JSONDecodeError as e:
            # Usercube-Decrypt-File writes errors in the output stream
            raise Exception(proc.stdout) from e
        return json_file_content

    def get_secure_data(self, attribute, erase_data):
        """Retrieve options from stdin. If erase_data is True, the data is deleted from the JSON tree which allows to release references on sensitive data like passwords and to clean up memory as soon as possible"""

        if self.json_input is None:
            line = sys.stdin.readline()
            try:
                self.json_input = json.loads(line)
            except json.JSONDecodeError as e:
                self.log_error(f"The options could not be loaded: {str(e)}")
                raise e

        data = None
        if attribute in self.json_input:
            data = self.json_input[attribute]
            if erase_data:
                del self.json_input[attribute]

        return data

    def _get_current_password_reset_setting(self) :
        password_reset_setting_path = OperatingSystem().join_path(self.orders_path, "PasswordResetSettings", "PasswordResetSettings.json")
        parsed_password_reset_settings = self._decrypt_json_file(password_reset_setting_path)
        current_password_reset_setting_id = parsed_password_reset_settings["PasswordResetSettingsIdByResourceTypeId"][self.current_resource_type_id]
        return  parsed_password_reset_settings["PasswordResetSettingsById"][current_password_reset_setting_id]

    def generate_password(self) :
        if self.needs_notification :
            self._log_message("Generating a new password before the notification is sent. Automatically sending notification.")
            self.send_password_notification()
        password_exe_path = OperatingSystem().join_path(self.runtime_path, "Usercube-PasswordGenerator.exe")
        current_password_reset_setting = self._get_current_password_reset_setting()
        arguments = self._compute_password_generation_arguments(password_exe_path, current_password_reset_setting)

        password_proc = subprocess.run(arguments, capture_output=True, encoding="utf-8-sig")

        try :
            password = self._process_password_stdout(password_proc.stdout)
        except :
            if len(password_proc.stderr) > 0 :
                index = password_proc.stderr.find(']')
                if index >= 0 :
                    self.log_error(password_proc.stderr[index+2:])  # The password generator's logs are in the "[hh:mm:ss ERR] {Message}" format. We only want the Message part.
                else :
                    self.log_error(password_proc.stderr)
        self.needs_notification = True
        self.password = password
        return password

    def send_password_notification(self, reset_uri = "") :
        parsed_password_reset_setting = self._get_current_password_reset_setting()

        if not(self.needs_notification or parsed_password_reset_setting["Mode"] == 2) :
            self.log_error("No password has been generated, or a mail notification has already been sent.")
            return

        self.needs_notification = False  # We send the notification, so we reset the notification state

        if parsed_password_reset_setting["DisableNotifications"] :
            self._log_message("Mail notifications are disabled")
            self._remove_password_from_memory()
            return

        arguments = self._compute_notification_arguments(parsed_password_reset_setting, reset_uri)

        notification_proc = subprocess.run(arguments, capture_output=True, encoding="utf-8-sig")

        self._process_stdout_and_stderr(notification_proc.stdout, notification_proc.stderr)

        self._remove_password_from_memory()

    def _compute_notification_arguments(self, parsed_password_reset_setting, reset_uri) :
        notification_exe_path = OperatingSystem().join_path(self.runtime_path, "Usercube-Send-PasswordNotification.exe")

        arguments = [notification_exe_path,
                "--assigned-resource-type", str(self.execution_id),
                "--resource-type-mapping", str(self.current_resource_type_id),
                ]
        if parsed_password_reset_setting["Mode"] == 1 :
            arguments.append("--password")
            arguments.append(self.password)
        else :
            arguments.append("--mode")
            arguments.append(str(parsed_password_reset_setting["Mode"]))

        if parsed_password_reset_setting["NotificationCC"] is None :
            arguments.append("--notification-cc")
            arguments.append(parsed_password_reset_setting["NotificationCC"])

        if len(reset_uri) > 0 :
            arguments.append("--reset-uri")
            arguments.append(reset_uri)

        return arguments

    def _remove_password_from_memory(self) :
        self.password = ""

    def _process_stdout_and_stderr(self, stdout, stderr) :
        stdout_lines = stdout.splitlines()
        for line in stdout_lines :
            index = line.find(']')
            self._log_message(line[index+2:])  # The password generator's logs are in the "[hh:mm:ss INF] {Message}" format. We only want the Message part.

        stderr_lines = stderr.splitlines()
        for line in stderr_lines :
            index = line.find(']')
            if index >= 0 :
                self.log_error(line[index+2:])  # The password generator's logs are in the "[hh:mm:ss ERR] {Message}" format. We only want the Message part.
            else :
                self.log_error(line)

    def _compute_password_generation_arguments(self, password_exe_path, parsed_password_reset_setting) :
        arguments = [password_exe_path,
                     "--auto-generate", str(parsed_password_reset_setting["AutoGenerate"]),
                     "--default-password", parsed_password_reset_setting["DefaultPassword"],
                     "--strength-check", parsed_password_reset_setting["StrengthCheck"],
                     "--generated-length", str(parsed_password_reset_setting["GeneratedLength"]),
                     "--lower-case-chars", str(parsed_password_reset_setting["GeneratedLowerCaseCharsCount"]),
                     "--upper-case-chars", str(parsed_password_reset_setting["GeneratedUpperCaseCharsCount"]),
                     "--digit-chars", str(parsed_password_reset_setting["GeneratedDigitCharsCount"]),
                     "--symbol-chars", str(parsed_password_reset_setting["GeneratedSymbolCharsCount"])
                    ]
        return arguments

    def _process_password_stdout(self, stdout_string) :
        searched_string = "Password:"
        stdout_lines = stdout_string.splitlines()
        for line in stdout_lines :
            index = line.find(searched_string)
            if index >= 0 :
                password = line[index + len(searched_string):]
            else :
                index = line.find(']')
                self._log_message(line[index+2:])  # The password generator's logs are in the "[hh:mm:ss INF] {Message}" format. We only want the Message part.
        return password

    def _log_message(self, message) :
        logger.console(message, newline=True, stream='stdout')

    def log_error(self, message) :
        logger.console(message, newline=True, stream='stderr')

    def log_debug(self, message) :
        for line in message.splitlines() :
            logger.console(f"[DBG]{line}", newline=True, stream='stderr')

    def try_keyword(self, keyword, *args) :
        status, _ = BuiltIn().run_keyword_and_ignore_error(keyword, *args)
        if (status == 'FAIL'):
            self.try_failed = True

    def catch_keyword(self, keyword, *args) :
        if self.try_failed :
            self.log_debug("Catching failed keyword")
            self.try_failed = False
            BuiltIn().run_keyword(keyword, *args)