From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 26 Mar 2019 20:01:41 +0000
Subject: [PATCH] posix/tst-getaddrinfo4: Consider EAI_NODATA as an
 expected result
In-Reply-To: <84dc1888-42f2-0d37-e3a4-473480b40a5e@synopsys.com>
References: <20180730104036.4016-1-abrodkin@synopsys.com>
 <84dc1888-42f2-0d37-e3a4-473480b40a5e@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4881796E12491D4BB15146FE0209CE6468238DBF@de02wembxa.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hello,

Any chance for this one to get reviewed?
It allows 1 more test to complete successfully in case of
certain (though seems to be valid) DNS server setups.

-Alexey

> -----Original Message-----
> From: Vineet Gupta <vgupta at synopsys.com>
> Sent: Monday, December 17, 2018 9:54 PM
> To: Alexey Brodkin <Alexey.Brodkin at synopsys.com>; libc-alpha at sourceware.org
> Cc: linux-snps-arc at lists.infradead.org
> Subject: Re: [PATCH] posix/tst-getaddrinfo4: Consider EAI_NODATA as an expected result
> 
> On 7/30/18 3:40 AM, Alexey Brodkin wrote:
> > Some proxy DNS servers might not resolve IPv6 names to addresses.
> > Instead they reply with NOERROR while passing no real data.
> > That combination of NOERROR and EAI_NODATA happen because the DNS
> > server has a recored for requested name (example.net in our case)
> > but that record is not of AAAA type which was requested.
> >
> > That's what Wireshark sees in that case:
> > ---------------------------------->8-----------------------------
> > Domain Name System (response)
> >    Transaction ID: 0x6e2e
> >    Flags: 0x8180 Standard query response, No error
> >        1... .... .... .... = Response: Message is a response
> >        .000 0... .... .... = Opcode: Standard query (0)
> >        .... .0.. .... .... = Authoritative: Server is not an authority for domain
> >        .... ..0. .... .... = Truncated: Message is not truncated
> >        .... ...1 .... .... = Recursion desired: Do query recursively
> >        .... .... 1... .... = Recursion available: Server can do recursive queries
> >        .... .... .0.. .... = Z: reserved (0)
> >        .... .... ..0. .... = Answer authenticated: Answer/authority portion was not authenticated by
> the server
> >        .... .... ...0 .... = Non-authenticated data: Unacceptable
> >        .... .... .... 0000 = Reply code: No error (0)
> >    Questions: 1
> >    Answer RRs: 0
> >    Authority RRs: 0
> >    Additional RRs: 0
> >    Queries
> >        example.net: type AAAA, class IN
> >            Name: example.net
> >            [Name Length: 11]
> >            [Label Count: 2]
> >            Type: AAAA (IPv6 Address) (28)
> >            Class: IN (0x0001)
> > ---------------------------------->8-----------------------------
> >
> > And that's what we see if Google DNS server (8.8.8.8) is used instead:
> > ---------------------------------->8-----------------------------
> > Domain Name System (response)
> >    Transaction ID: 0x3cd4
> >    Flags: 0x8180 Standard query response, No error
> >        1... .... .... .... = Response: Message is a response
> >        .000 0... .... .... = Opcode: Standard query (0)
> >        .... .0.. .... .... = Authoritative: Server is not an authority for domain
> >        .... ..0. .... .... = Truncated: Message is not truncated
> >        .... ...1 .... .... = Recursion desired: Do query recursively
> >        .... .... 1... .... = Recursion available: Server can do recursive queries
> >        .... .... .0.. .... = Z: reserved (0)
> >        .... .... ..0. .... = Answer authenticated: Answer/authority portion was not authenticated by
> the server
> >        .... .... ...0 .... = Non-authenticated data: Unacceptable
> >        .... .... .... 0000 = Reply code: No error (0)
> >    Questions: 1
> >    Answer RRs: 1
> >    Authority RRs: 0
> >    Additional RRs: 0
> >    Queries
> >        example.net: type AAAA, class IN
> >            Name: example.net
> >            [Name Length: 11]
> >            [Label Count: 2]
> >            Type: AAAA (IPv6 Address) (28)
> >            Class: IN (0x0001)
> > Answers
> >    example.net: type AAAA, class IN, addr 2606:2800:220:1:248:1893:25c8:1946
> > ---------------------------------->8-----------------------------
> > ---
> >  posix/tst-getaddrinfo4.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/posix/tst-getaddrinfo4.c b/posix/tst-getaddrinfo4.c
> > index dc9e423448af..0139dee777a1 100644
> > --- a/posix/tst-getaddrinfo4.c
> > +++ b/posix/tst-getaddrinfo4.c
> > @@ -39,6 +39,7 @@ try (const char *service, int family, int flags)
> >      case 0:
> >      case EAI_AGAIN:
> >      case EAI_NONAME:
> > +    case EAI_NODATA:
> >        printf ("SUCCESS getaddrinfo(service=%s, family=%d, flags=%d): %s: %m\n",
> >                service ?: "NULL", family, flags, gai_strerror (res));
> >        return 0;
> >
> 
> Ping !
