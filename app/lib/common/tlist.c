/*
 * file tlist.c
 * date 2019-09-30
 * author kim hyun-ki
 */

#include <tlist.h>

tlist *tlist_create (void)
{
	tlist list;
	list = (tlist *) malloc(sizeof(list));
	if (list) {
		list->flist = NULL;
		list->fcount = 0;
		list->fcapacity = 0;
	}

	return list;
}
