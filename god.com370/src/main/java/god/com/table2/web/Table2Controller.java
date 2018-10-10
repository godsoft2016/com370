package god.com.table2.web;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import god.com.table.service.TableVO;
import god.com.table.service.impl.TableDAO;

@Controller
public class Table2Controller {

	private static final Logger LOGGER = LoggerFactory.getLogger(Table2Controller.class);

	@Resource(name = "TableDAO")
	private TableDAO tableDAO;

	@RequestMapping("/table2/selectTable2List.do")
	public String selectList(ModelMap model) {
		LOGGER.debug("목록");
		return "god/com/table2/selectTable2List";
	}

	@RequestMapping("/table2/insertTable2Form.do")
	public String insertForm(ModelMap model) {
		LOGGER.debug("등록폼");
		return "god/com/table2/insertTable2Form";
	}

	@RequestMapping("/table2/insertTable2.do")
	public String insert(TableVO vo, ModelMap model) throws Exception {
		LOGGER.debug("등록");
		LOGGER.debug("vo=" + vo);
		LOGGER.debug("getApplcntNm=" + vo.getApplcntNm());
		System.out.println("vo=" + vo);
		System.out.println("getApplcntNm=" + vo.getApplcntNm());

		tableDAO.insert(vo);

		return "god/com/table2/insertTable2";
	}

}
