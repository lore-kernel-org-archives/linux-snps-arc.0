From: till.smejkal@googlemail.com (Till Smejkal)
Date: Mon, 13 Mar 2017 18:31:12 -0700
Subject: [RFC PATCH 00/13] Introduce first class virtual address spaces
In-Reply-To: <fa60d132-0eef-4350-3c88-1558f447a48f@twiddle.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170314013112.ofhcgg2stzoft5mw@arch-dev>
To: linux-snps-arc@lists.infradead.org

On Tue, 14 Mar 2017, Richard Henderson wrote:
> On 03/14/2017 10:39 AM, Till Smejkal wrote:
> > > Is this an indication that full virtual address spaces are useless?  It
> > > would seem like if you only use virtual address segments then you avoid all
> > > of the problems with executing code, active stacks, and brk.
> > 
> > What do you mean with *virtual address segments*? The nice part of first class
> > virtual address spaces is that one can share/reuse collections of address space
> > segments easily.
> 
> What do *I* mean?  You introduced the term, didn't you?
> Rereading your original I see you called them "VAS segments".

Oh, I am sorry. I thought that you were referring to some other feature that I don't
know.

> Anyway, whatever they are called, it would seem that these segments do not
> require any of the syncing mechanisms that are causing you problems.

Yes, VAS segments provide a possibility to share memory regions between multiple
address spaces without the need to synchronize heap, stack, etc. Unfortunately, the
VAS segment feature itself without the whole concept of first class virtual address
spaces is not as powerful. With some additional work it can probably be represented
with the existing shmem functionality.

The first class virtual address space feature on the other side provides a real
benefit for applications in our opinion namely that an application can switch between
different views on its memory which enables various interesting programming paradigms
as mentioned in the cover letter.

Till
