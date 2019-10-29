/*
 * file   pollmng.h
 * date   2019-09-30
 * auther 김현기 khkraining@gmail.com 
 * brief  poll manager
 */

#ifndef _POLL_MNG_H_
#define _POLL_MNG_H_

#define STYP_FILE 5

void poll_init (void);

typedef struct poll_obj poll_obj_t;

struct poll_obj{
    int fd;
    int type;
    int tag;
    void *socket; 
    void *user;

    int (*on_poll_in)  (poll_obj_t *obj);
    int (*on_poll_out) (poll_obj_t *obj);
    int (*on_poll_err( (poll_obj_t *obj);
    int (*on_poll_hup) (poll_obj_t *obj);

    int (*on_timeout)  (poll_obj_t *obj);

};

typedef struct poll_obj poll_obj_t;

#endif // _POLL_MNG_H_
