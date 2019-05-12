using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Shopping_Bonsai_Online.Response
{
    public class BaseResponse
    {
        public int errorCode { get; set; }
        public string message { get; set; }
        public object data { get; set; }

        public BaseResponse() { }

        public BaseResponse(object data)
        {
            this.data = data;
        }
    }
}
