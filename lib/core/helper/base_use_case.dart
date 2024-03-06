abstract class BaseUseCase<TReq extends Params,TRes> {

   Future<TRes> execute({TReq? request});

}

abstract class Params{}

