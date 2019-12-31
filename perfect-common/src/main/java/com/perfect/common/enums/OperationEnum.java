package com.perfect.common.enums;
public enum OperationEnum {
	ADD,
	UPDATE,
	DELETE,
	LOGIC_DELETE;

	public String getType() {
		if (this.equals(ADD)) {
			return "ADD";
		}
		if (this.equals(UPDATE)) {
			return "UPDATE";
		}
		if (this.equals(DELETE)) {
			return "DELETE";
		}
		if (this.equals(LOGIC_DELETE)) {
			return "LOGIC_DELETE";
		}
		return null;
	};
}
