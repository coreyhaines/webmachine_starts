%% @author author <author@example.com>
%% @copyright YYYY author.
%% @doc Example webmachine_resource.

-module(zak_resource).
-export([init/1, to_html/2]).

-include_lib("webmachine/include/webmachine.hrl").

init([]) -> {ok, undefined}.

to_html(ReqData, State) ->
  {Index, Picture} = get_picture(),
  {"<html><body><h1>"++integer_to_list(Index)++"</h1><img src='/images/"++Picture++"' width='640px'/></body></html>", ReqData, State}.

get_picture() ->
  ZakPictures = ["zak"++integer_to_list(Index)++".jpg" || Index <- [1,2,3,4]],
  Pictures = ["lavaflow.jpg"|ZakPictures],
  Index = random:uniform(4),
  Picture = lists:nth(Index, ZakPictures),
  {Index, Picture}.
