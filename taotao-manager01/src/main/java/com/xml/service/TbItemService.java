package com.xml.service;

import java.util.List;

import com.xml.bean.TbItem;
import com.xml.common.TaotaoResult;
import com.xml.utils.Jason;
import com.xml.utils.TbltemUtils;

public interface TbItemService {
	/**
	 * 根据商品id查询商品信息
	 * @param tbItemId 商品id
	 * @return 返回指定商品id的商品信息
	 */
	TbItem findTbItemById(Long tbItemId);
	/**
	 * 查询分页条数
	 * @param tbItem 商品对象
	 * @return 返回对象
	 */
	List<TbItem> findTbItemAll(Integer page,Integer limit);
	/**
	 * 查询总记录条数
	 * @return
	 */
	Integer findAllCount();
	/**
	 * 根据商品id删除商品信息
	 * @param tbItemId 商品id
	 * @return 返回一个状态码
	TaotaoResult deleteTbItemById(List<TbItem>tbItems);
	 */
	/**
	 * 上架下架和删除方法 但是这个删除 不是真的删除数据 而是 修改商品的状态
	 * @param items 需要上架和下架的商品对象集合 只需要id
	 * @param type 0代表下架 1代表上架  2代表删除
	 * @return
	 */
	TaotaoResult updateItems(List<TbItem>items,Integer type);
}
