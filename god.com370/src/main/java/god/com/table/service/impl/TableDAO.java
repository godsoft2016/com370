package god.com.table.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import god.com.table.service.TableVO;

@Repository("TableDAO")
public class TableDAO extends EgovComAbstractDAO {

	public Object insert(TableVO vo) throws Exception {
		return insert("TableDAO.insert", vo);
	}

	@SuppressWarnings("unchecked")
	public List<EgovMap> selectList(TableVO vo) throws Exception {
		return (List<EgovMap>) list("TableDAO.selectList", vo);
	}

	public int selectListCnt(TableVO vo) throws Exception {
		return (int) select("TableDAO.selectListCnt", vo);
	}

	public EgovMap select(TableVO vo) {
		return (EgovMap) select("TableDAO.select", vo);
	}

	public int update(TableVO vo) {
		return update("TableDAO.update", vo);
	}

	public int delete(TableVO vo) {
		return update("TableDAO.delete", vo);
	}

	public int delete2(TableVO vo) {
		return delete("TableDAO.delete2", vo);
	}

}
