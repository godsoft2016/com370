package god.com.table.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import god.com.table.service.TableVO;

@Repository("TableDAO")
public class TableDAO extends EgovComAbstractDAO {

	public Object insert(TableVO vo) throws Exception {
		return insert("TableDAO.insert", vo);
	}

}
