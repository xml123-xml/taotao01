package com.xml.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xml.bean.TbItem;
import com.xml.common.TaotaoResult;
import com.xml.mapper.TbItemMapper;
import com.xml.service.TbItemService;
import com.xml.utils.Jason;
import com.xml.utils.TbltemUtils;
@Service
public class TbItemServiceImpl implements TbItemService {
	@Autowired
	private TbItemMapper tbItemMapper;
	public TbItem findTbItemById(Long tbItemId) {
		TbItem tbItem= tbItemMapper.findTbItemById(tbItemId);
		return tbItem;
	}
	public List<TbItem> findTbItemAll(Integer page,Integer limit) {
		List<TbItem> tbItems=tbItemMapper.findTbItemAll(page, limit);
		return tbItems;
	}
	public Integer findAllCount() {
		Integer i=tbItemMapper.findAllCount();
		return i;
	}
	//public TaotaoResult deleteTbItemById(List<TbItem>tbItems) {
	//	int i =tbItemMapper.deleteTbItemById(tbItems);
		//return i;
	//}
	public TaotaoResult updateItems(List<TbItem> items, Integer type) {
		List<Long> ids = new ArrayList<Long>();

		for (TbItem tbItem : items) {

			ids.add(tbItem.getId());

		}

		int count = tbItemMapper.updateItemByIds(ids, type);

		if(count>0&&type==0){

			return TaotaoResult.build(200, "商品下架成功");

		}else if(count>0&&type==1){

			return TaotaoResult.build(200, "商品上架成功");

		}else if(count>0&&type==2){

			return TaotaoResult.build(200, "商品删除成功");

		}

		return TaotaoResult.build(500, "操作有误");
	}

}
