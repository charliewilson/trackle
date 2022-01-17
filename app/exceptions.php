<?php

namespace trackle\Exceptions;

use Exception;

class InvalidShareTextException extends Exception {}

class CantCreateResultException extends Exception {}
class PuzzleAlreadyDoneException extends Exception {}

class UserNotFoundException extends Exception {}
class ResultNotFoundException extends Exception {}

/*
 * TODO: decide implementation (if at all) of below
 * class PageNotFoundException extends Exception {}
 */