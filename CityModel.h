//
//  CityModel.h
//  O2OProject
//
//  Created by Zhang on 3/2/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *is_open;

@property (nonatomic, copy) NSString *uname;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *zm;

@property (nonatomic, copy) NSString *url;

@end

@interface A : City
@end
@interface B : City
@end
@interface C : City
@end
@interface D : City
@end
@interface E : City
@end
@interface F : City
@end
@interface G : City
@end
@interface H : City
@end
@interface I : City
@end
@interface J : City
@end
@interface K : City
@end
@interface L : City
@end
@interface M : City
@end
@interface N : City
@end
@interface O : City
@end
@interface P : City
@end
@interface Q : City
@end
@interface R : City
@end
@interface S : City
@end
@interface T : City
@end
@interface U : City
@end
@interface V : City
@end
@interface W : City
@end
@interface X : City
@end
@interface Y : City
@end
@interface Z : City
@end


@interface HotCity : NSObject

@end

@interface City_List : NSObject

@property (nonatomic, strong) NSArray<A *> *A;

@property (nonatomic, strong) NSArray<B *> *B;

@property (nonatomic, strong) NSArray<C *> *C;

@property (nonatomic, strong) NSArray<D *> *D;

@property (nonatomic, strong) NSArray<E *> *E;

@property (nonatomic, strong) NSArray<F *> *F;

@property (nonatomic, strong) NSArray<G *> *G;

@property (nonatomic, strong) NSArray<H *> *H;

@property (nonatomic, strong) NSArray<I *> *I;

@property (nonatomic, strong) NSArray<J *> *J;

@property (nonatomic, strong) NSArray<K *> *K;

@property (nonatomic, strong) NSArray<L *> *L;

@property (nonatomic, strong) NSArray<M *> *M;

@property (nonatomic, strong) NSArray<N *> *N;

@property (nonatomic, strong) NSArray<O *> *O;

@property (nonatomic, strong) NSArray<P *> *P;

@property (nonatomic, strong) NSArray<Q *> *Q;

@property (nonatomic, strong) NSArray<R *> *R;

@property (nonatomic, strong) NSArray<S *> *S;

@property (nonatomic, strong) NSArray<T *> *T;

@property (nonatomic, strong) NSArray<U *> *U;

@property (nonatomic, strong) NSArray<V *> *V;

@property (nonatomic, strong) NSArray<W *> *W;

@property (nonatomic, strong) NSArray<X *> *X;

@property (nonatomic, strong) NSArray<Y *> *Y;

@property (nonatomic, strong) NSArray<Z *> *Z;

@end

@interface CityModel : NSObject

@property (nonatomic, copy) NSString *act;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) NSArray *hot_city;

@property (nonatomic, assign) NSInteger u_return;

@property (nonatomic, copy) NSString *sess_id;

@property (nonatomic, copy) NSString *ref_uid;

@property (nonatomic, copy) NSString *page_title;

@property (nonatomic, strong) City_List *city_list;

@property (nonatomic, copy) NSString *ctl;

@property (nonatomic, copy) NSString *city_name;

@property (nonatomic, copy) NSString *info;

@end
