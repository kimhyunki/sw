/*
 * file pollmng.c
 * date 2019-09-30
 * author kim hyun ki
 */

#include <stdio.h>
#include <stddef.h>

#include <tlist.h>
#include <pollmng.h>

#include <string.h>
#include <stdlib.h>

typedef enum {false, true} bool;

static tlist *poll_list = NULL;
static int is_need_rebuild = true;
static int is_loop_break = false;

void poll_init (void)
{
	poll_list = tlist_create();

	is_need_rebuild = true;
	is_loop_break = false;
}


/* 
 * brief 파일 디스크립터를 등록
 */
poll_obj_t *poll_add(int fd)
{
	poll_obj_t *obj;
	int idx;

	if (NULL == poll_list) {
		printf("error need to call poll_init()\n");
		return NULL;
	}

	obj = (poll_obj_t *) malloc(sizeof(poll_obj_t));
	memset((void *)obj, 0, sizeof(poll_obj_t));

	obj->fd = fd;
	obj->type = STYP_FILE;
	obj->tag = 0;
	obj->on_poll_in = NULL;
	obj->on_poll_out = NULL;
	
}
