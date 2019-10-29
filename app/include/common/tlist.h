/*
 * file tlist.h
 * date 2019-09-30
 * author kim hyun-ki
 */

#ifndef _TLIST_H_
#define _TLIST_H_

typedef struct {
    void **flist;
    int fcount;
    int fcapacity;
} tlist;

/* user used func list */
extern tlist *tlist_create(void);

#endif // _TLIST_H_
