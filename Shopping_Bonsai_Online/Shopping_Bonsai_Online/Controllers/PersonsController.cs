using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Shopping_Bonsai_Online.Model;
using Shopping_Bonsai_Online.Response;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Shopping_Bonsai_Online.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PersonsController : ControllerBase
    {
        private readonly Context _context;
        public PersonsController(Context context)
        {
            this._context = context;
        }

        // GET: api/persons
        [HttpGet]
        public async Task<ActionResult<BaseResponse>> GetAll()
        {
            return new BaseResponse
            {
                errorCode = 0,
                message = "Get list of person successfully!",
                data = await _context.persons.ToListAsync()
            };
        }

        // GET api/persons/id
        [HttpGet("{id}")]
        public async Task<ActionResult<BaseResponse>> Get(int id)
        {
            var person = await _context.persons.FindAsync(id);

            if (person == null)
            {
                return new BaseResponse
                {
                    errorCode = 1,
                    message = "Person[" + id + "] not exists"
                };
            }

            return new BaseResponse
            {
                errorCode = 0,
                message = "Person[" + id + "] is finded",
                data = person
            };
        }
        

        // POST api/<controller>
        [HttpPost]
        public async Task<ActionResult<BaseResponse>> Post(Person newPerson)
        {
            try
            {
                _context.persons.Add(newPerson);
                await _context.SaveChangesAsync();
                return new BaseResponse
                {
                    errorCode = 0,
                    message = "Person \"" + newPerson.firstName + "\" is posted",
                    data = newPerson
                };
            }
            catch
            {
                return new BaseResponse
                {
                    errorCode = 1,
                    message = "Error post"
                };
            }
        }
        

        // PUT api/person/id
        [HttpPut("{id}")]
        public async Task<ActionResult<BaseResponse>> Put(Person newPerson, int id)
        {
            var needle = await _context.persons.FindAsync(id);

            if (needle == null)
            {
                return new BaseResponse
                {
                    errorCode = 1,
                    message = "Person[" + id + "] is not exists"
                };
            }

            needle.id = newPerson.id;
            needle.firstName = newPerson.firstName;
            needle.lastName = newPerson.lastName;
            needle.phone = newPerson.phone;
            needle.email = newPerson.email;
            needle.address = newPerson.address;
            needle.username = newPerson.username;
            needle.password = Utils.Helper.Gethash(newPerson.password);

            _context.persons.Update(needle);
            await _context.SaveChangesAsync();

            return new BaseResponse
            {
                errorCode = 0,
                message = "Person[" + id + "] is putted",
                data = newPerson
            };
        }

        // DELETE api/<controller>/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<BaseResponse>> Delete(int id)
        {
            var needle = await _context.persons.FindAsync(id);

            if (needle == null)
            {
                return new BaseResponse
                {
                    errorCode = 1,
                    message = "Person[" + id + "] is not exists"
                };
            }

            _context.persons.Remove(needle);
            await _context.SaveChangesAsync();

            return new BaseResponse
            {
                errorCode = 0,
                message = "Person[" + id + "] is removed",
                data = needle
            };
        }
        
    }
}
