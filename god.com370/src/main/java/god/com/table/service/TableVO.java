package god.com.table.service;

import org.apache.commons.lang3.builder.ToStringBuilder;

import egovframework.com.cmm.ComDefaultVO;

@SuppressWarnings("serial")
public class TableVO extends ComDefaultVO {

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

	private String tableId;
	private String tableNm;
	private String columnNm1;
	private String columnNm2;
	private String columnNm3;
	private String applcntNm;
	private String useAt;

	public String getTableId() {
		return tableId;
	}

	public void setTableId(String tableId) {
		this.tableId = tableId;
	}

	public String getTableNm() {
		return tableNm;
	}

	public void setTableNm(String tableNm) {
		this.tableNm = tableNm;
	}

	public String getColumnNm1() {
		return columnNm1;
	}

	public void setColumnNm1(String columnNm1) {
		this.columnNm1 = columnNm1;
	}

	public String getColumnNm2() {
		return columnNm2;
	}

	public void setColumnNm2(String columnNm2) {
		this.columnNm2 = columnNm2;
	}

	public String getColumnNm3() {
		return columnNm3;
	}

	public void setColumnNm3(String columnNm3) {
		this.columnNm3 = columnNm3;
	}

	public String getApplcntNm() {
		return applcntNm;
	}

	public void setApplcntNm(String applcntNm) {
		this.applcntNm = applcntNm;
	}

	public String getUseAt() {
		return useAt;
	}

	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}

}
