package com.xml.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.xml.bean.TbItem;
import com.xml.common.TaotaoResult;
import com.xml.service.TbItemService;
import com.xml.utils.Jason;
import com.xml.utils.TbltemUtils;

@Controller
@RequestMapping("item")
public class TbItemController {
	@Autowired
	private TbItemService tbItemService;
	@RequestMapping("/{itemId}")
	@ResponseBody
	public TbItem findTbItemById(@PathVariable Long itemId){
		TbItem tbItem = tbItemService.findTbItemById(itemId);
		return tbItem;
	}
	@RequestMapping("/tbitem")
	@ResponseBody
	public Jason findTbItemAll(Integer page,Integer limit){
		Integer i=tbItemService.findAllCount();
		List<TbItem>tbItems=tbItemService.findTbItemAll(page, limit);
		Jason jason=new Jason();
		jason.setCount(i);
		jason.setCode(0);
		jason.setMsg("");
		jason.setData(tbItems);
		return jason;
	}
	@RequestMapping("/delete")
	@ResponseBody
	public TaotaoResult deleteTbItemById(@RequestBody List<TbItem> items){
		TaotaoResult result = tbItemService.updateItems(items, 2);
		return result;
	}
	@RequestMapping("/commodityUpdate")
	@ResponseBody
	public TaotaoResult CommodityUpdate(@RequestBody List<TbItem> items){
		TaotaoResult result = tbItemService.updateItems(items,1);
		return result;
	}
	@RequestMapping("/commodityDelete")
	@ResponseBody
	public TaotaoResult CommodityDelete(@RequestBody List<TbItem> items){
		TaotaoResult result = tbItemService.updateItems(items, 0);
		return result;
		
	}
}
