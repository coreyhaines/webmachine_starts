%% @author author <author@example.com>
%% @copyright YYYY author.
%% @doc Example webmachine_resource.

-module(zak_resource).
-export([init/1, to_html/2]).

-include_lib("webmachine/include/webmachine.hrl").

init([]) -> {ok, undefined}.

to_html(ReqData, State) ->
  {"<html><body><img src='/images/"++get_picture()++"' width='640px'/></body></html>", ReqData, State}.

get_picture() ->
  ZakPictures = ["zak"++integer_to_list(Index)++".jpg" || Index <- [2,3,4]],
  Pictures = ["lavaflow.jpg"|ZakPictures],
  Index = random:uniform(length(ZakPictures)),
  lists:nth(Index, ZakPictures).
