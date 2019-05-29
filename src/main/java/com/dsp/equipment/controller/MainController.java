package com.dsp.equipment.controller;

import com.dsp.equipment.services.FunServiceImpl;
import com.dsp.equipment.services.RoleServiceImpl;
import com.dsp.equipment.utils.Check;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class MainController {

	@Autowired
	private RoleServiceImpl roleServiceImp;
	@Autowired
	private FunServiceImpl funServiceImp;

	/**
	 * 单纯的页面跳转
	 * 
	 * @param name
	 * @return
	 */
	@RequestMapping(value = "/page/{name}", method = RequestMethod.GET)
	public String page(@PathVariable String name) {
		return name;
	}

	/**
	 * 单纯的页面跳转
	 *
	 * 页面名称，即jsp文件名
	 *
	 * @return
	 */
	@RequestMapping(value = "/page/{model}/{fun}", method = RequestMethod.GET)
	public String page(@PathVariable String model, @PathVariable String fun) {
		return model + "/" + fun;
	}

	/**
	 * 单纯的页面跳转
	 *
	 * 页面名称，即jsp文件名
	 *
	 * @return
	 */
	@RequestMapping(value = "/page/{model}/{fun}/{file}", method = RequestMethod.GET)
	public String page(@PathVariable String model, @PathVariable String fun, @PathVariable String file) {
		return model + "/" + fun + "/" + file;
	}


	// 验证码
	@RequestMapping("/check")
	@ResponseBody
	public void check(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		Check check = new Check();
		String random = check.check(120,37,resp);
		req.getSession().setAttribute("userCode", random);
	}

}
