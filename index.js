'use strict';

exports.handler = async (event, context, callback) => {
    console.log(event);
    console.log(context);
    console.log(callback);
    return 'Hello index js lambda';
};