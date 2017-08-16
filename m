From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed, 16 Aug 2017 11:52:42 +0000
Subject: [PATCH] earlycon: initialise baud field of earlycon device
 structure
In-Reply-To: <CAL_Jsq+=LQ0kXtBx7xXJEb0FtfqwQRZoUYtG0oDFnUj_VfoG1A@mail.gmail.com>
References: <20170815172141.29115-1-Eugeniy.Paltsev@synopsys.com>
 <CAL_Jsq+=LQ0kXtBx7xXJEb0FtfqwQRZoUYtG0oDFnUj_VfoG1A@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1502884362.2586.32.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Rob,

On Tue, 2017-08-15@14:26 -0500, Rob Herring wrote:
> On Tue, Aug 15, 2017 at 12:21 PM, Eugeniy Paltsev
> <Eugeniy.Paltsev@synopsys.com> wrote:
> > [snip]
> > @@ -282,7 +283,15 @@ int __init of_setup_earlycon(const struct
> > earlycon_id *match,
> >?????????????????}
> >?????????}
> >?
> > +???????val = of_get_flat_dt_prop(node, "baud", NULL);
>?
> No, we already have a defined way to set the baud, we don't need a
> property in addition. Plus you didn't document it.

I guess by defined way to set the baud you mean setting baud after
device alias
in stdout-path property (like stdout-path = "serial:115200n8"), right?

The idea was to reuse "baud" property from serial node to set the
earlycon baud:

chosen {
????...
????stdout-path = &serial;
};

serial: uart at ... {
????...
????baud = <115200>;   /* Get baud from here */
};

> > +???????if (val)
> > +???????????????early_console_dev.baud = be32_to_cpu(*val);
> > +
> >?????????if (options) {
> > +???????????????err = kstrtoul(options, 10, &baud);
> > +???????????????if (!err)
> > +???????????????????????early_console_dev.baud = baud;
>?
> This seems fine to do here, but then we should also parse the other
> standard options here too. And we should make sure we're not doing it
> twice.
I added only baud parsing here because we parse only baud from standard
options
when register_earlycon is used. (see parse_options function which is
called
from register_earlycon)

But I can add other standard options parsing here (probably using
uart_parse_options + uart_set_options).?
What do you think?

> > +
> >?????????????????strlcpy(early_console_dev.options, options,
> >?????????????????????????sizeof(early_console_dev.options));
> >?????????}
> > --
> > 2.9.3
--?
?Eugeniy Paltsev
