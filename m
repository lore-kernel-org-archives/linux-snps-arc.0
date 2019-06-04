From: David.Laight@ACULAB.COM (David Laight)
Date: Tue, 4 Jun 2019 09:01:31 +0000
Subject: [PATCH] kbuild: use more portable 'command -v' for cc-cross-prefix
In-Reply-To: <CAK7LNAR_A1d5keiCRthNioW3nqkNadJkaCyMR3a5S8WS0jhgNQ@mail.gmail.com>
References: <20190603104902.23799-1-yamada.masahiro@socionext.com>
 <863c29c5f0214c008fbcbb2aac517a5c@AcuMS.aculab.com>
 <CAK7LNARHR=xv_YxQCkCM7PtW3vpNfXOgZrez0c4HbMX6C-8-uA@mail.gmail.com>
 <810dd6ae018b4a31b70d26fb6b29e48d@AcuMS.aculab.com>
 <CAK7LNAR_A1d5keiCRthNioW3nqkNadJkaCyMR3a5S8WS0jhgNQ@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <96b710063de5464ea347bfa1e03308b5@AcuMS.aculab.com>
To: linux-snps-arc@lists.infradead.org

From: Masahiro Yamada
> Sent: 04 June 2019 04:31
...
> > > > You could use:
> > > >         $(shell sh -c "command -v $(c)gcc")
> > > > or maybe:
> > > >         $(shell command$${x:+} -v $(c)gcc)
> > >
> > >
> > > How about this?
> > >
> > >           $(shell : ~; command -v $(c)gcc)
> >
> > Overcomplicated ....
> >
> > I've not looked at the list of 'special characters' in make,
> > but I suspect any variable expansion is enough.
> > Since ${x:+} always expands to the empty string (whether or
> > not 'x' is defined) it can't have any unfortunate side effects.
> 
> 
> Probably, my eyes are used to Makefile.
> ":" is a no-op command, and it is used everywhere in kernel Makefiles
> in the form of "@:'
> 
> It depends on people which solution seems simpler.
> So, this argument tends to end up with bikesheding.

I am fully aware of ':', it is a shell builtin that always return success.
Usually used when you want the side-effects of substitutions without
executing anything (eg : ${foo:=bar} ), to change the result of a
sequence of shell commands or as a dummy (eg while :; do :; done; )
Very annoyingly bash parses !: as something other than 'not true'.

$(shell command$${x:+} -v $(c)gcc) will be marginally faster
because it is less parsing.

	David
 

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
