UPDATE UM_Sequences set Value = (select MAX(Id) from UA_AccessControlPermissions where id < 4611686018427387903) + 100
WHERE Id = (SELECT id from UM_EntityTypes where Identifier = 'AccessControlPermission')
