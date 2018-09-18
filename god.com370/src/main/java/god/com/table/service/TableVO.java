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
	private String applcntNm;
	private String useAt;

	public String getApplcntNm() {
		return applcntNm;
	}

	public void setApplcntNm(String applcntNm) {
		this.applcntNm = applcntNm;
	}

}
