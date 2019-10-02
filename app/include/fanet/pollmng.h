/*
 * file   pollmng.h
 * date   2019-09-30
 * auther 김현기 khkraining@gmail.com 
 * brief  poll manager
 */

#ifndef _POLL_MNG_H_
#define _POLL_MNG_H_

void poll_init (void);

typedef struct {
    int fd;

} poll_obj_t;

#endif // _POLL_MNG_H_

