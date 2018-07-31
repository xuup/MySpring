package com.coco.util;


public class PaginationUtil {
	/**
	 * 封装分页参数
	 * 
	 * @param httpRequest
	 * @return map
	 */
	public static void paginationHandle(BaseGridVo gb) {
		if (gb.getLength() != 0) {
			if (gb.getRecords() == 0) {
				gb.setTotal(0);
				gb.setPage(0);
			} else {
				gb.setTotal((gb.getRecords() - 1) / gb.getLength() + 1);
				if (gb.getPage() > gb.getTotal()) {
					gb.setBegin(0);
					gb.setPage(1);
				} else {
					gb.setBegin(gb.getLength() * (gb.getPage() - 1));
				}
			}
		}
	}

	/**
	 * 封装分页参数
	 * 
	 * @param httpRequest
	 * @return map
	 */
	public static void paginationHandleInf(BaseGridVo gb) {
		if (gb.getLength() == 0) {
			return;
		}
		gb.setBegin(gb.getLength() * (gb.getPage() - 1));
	}

}
