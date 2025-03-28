using System;
using System.Collections;
using System.Diagnostics;
using System.IO;
using static libyaml.libyaml;

namespace example;

static class Program
{
	static int Main(params String[] args)
	{
		yaml_parser_t parser = .();
		yaml_event_t event = .();

		bool done = false;

		/* Create the Parser object. */
		yaml_parser_initialize(&parser);

		/* Set a string input. */
		char8* input = "key: ['string1']";
		uint length = (.)StringView(input).Length;

		yaml_parser_set_input_string(&parser, (.)input, length);

		/* Read the event sequence. */
		while (!done)
		{

			/* Get the next event. */
			if (yaml_parser_parse(&parser, &event) == 0)
			{
				Debug.WriteLine("parse error");
			}

			switch (event.type) {
			case .YAML_SCALAR_EVENT:
				char8* val = (.)event.data.scalar.value;
				Debug.WriteLine($"{StringView(val)}");
			default:
				break;
			}

			/* Are we finished? */
			done = (event.type == .YAML_STREAM_END_EVENT);

			/* The application is responsible for destroying the event object. */
			yaml_event_delete(&event);
		}

		/* Destroy the Parser object. */
		yaml_parser_delete(&parser);

		return 0;
	}
}