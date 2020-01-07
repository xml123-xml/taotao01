package com.xml.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xml.bean.TbItem;

public interface TbItemMapper {
	/**
	 * 查询tbitem表根据商品id查询商品信息
	 * @param tbItemId
	 * @return
	 */
	TbItem findTbItemById(Long tbItemId);
	/**
	 * 查询所有的商品信息
	 * @param tbItem
	 * @return 返回一个集合
	 */
	List<TbItem> findTbItemAll(Integer page,Integer limit);
	/**
	 * 查询总记录条数
	 * @return
	 */
	Integer findAllCount();
	/**
	 * 删除商品
	 * @param tbItemId
	 * @return
	int deleteTbItemById(List<TbItem> tbItems);
	 */
	/**

	 * 根据商品id删除商品信息 
	 * @param items
	 * @return 如果返回的数据大于0表示删除成功
	 * int delteItemByIds(@Param("ids") List<Long> ids);
	 */
	int updateItemByIds(@Param("ids") List<Long> ids,@Param("type") Integer type);
	
}
