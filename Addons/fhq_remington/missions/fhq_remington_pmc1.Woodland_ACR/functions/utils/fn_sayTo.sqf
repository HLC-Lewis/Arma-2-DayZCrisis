/*
 * Have someone say something from the 'speech' topic to someone else,
 * then wait for it to "arrive".
 * Speaker and listener must know the topic already
 *
 * Parameter
 *	_this select 0 - the speaker/sender
 *  	_this select 1 - the listener/receiver. Can be a group
 *  	_this select 2 - the sentence identifier base
 *  	_this select 3 - the sentence number
 * 
 * result: 
 * 	 	none
 */
 
 private ["_speaker", "_listener", "_sentence", "_sentenceString"];
 
_speaker  = _this select 0;
_listener = _this select 1;
_idprefix = _this select 2;
_sentence = _this select 3;

_sentenceString = "0001";
if (_sentence < 10) then 
{
	_sentenceString = format ["000%1", _sentence];
}
else 
{
	if (_sentence < 100) then 
	{
		_sentenceString = format ["00%1", _sentence];
	}
	else 
	{
		if (_sentence < 1000) then 
		{
			_sentenceString = format ["00%1", _sentence];
		}
		else
		{
			_sentenceString = format ["%1", _sentence];
		};
	};
};

_sentenceString = _idprefix + _sentenceString;

_speaker kbTell [_listener, "speech", _sentenceString];
waitUntil {_speaker kbWasSaid [_listener, "speech", _sentenceString, 30]};
sleep 1;

