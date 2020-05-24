*STree-Core-Core-removing
removeMember: memberName
	self fileUtils deleteFile: memberName in:  self packageFileDirectory