From: rth@twiddle.net (Richard Henderson)
Date: Tue, 14 Mar 2017 11:02:37 +1000
Subject: [RFC PATCH 00/13] Introduce first class virtual address spaces
In-Reply-To: <20170314003935.2jwycgajo7eojmvm@arch-dev>
References: <20170314003935.2jwycgajo7eojmvm@arch-dev>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <fa60d132-0eef-4350-3c88-1558f447a48f@twiddle.net>
To: linux-snps-arc@lists.infradead.org

On 03/14/2017 10:39 AM, Till Smejkal wrote:
>> Is this an indication that full virtual address spaces are useless?  It
>> would seem like if you only use virtual address segments then you avoid all
>> of the problems with executing code, active stacks, and brk.
>
> What do you mean with *virtual address segments*? The nice part of first class
> virtual address spaces is that one can share/reuse collections of address space
> segments easily.

What do *I* mean?  You introduced the term, didn't you?
Rereading your original I see you called them "VAS segments".

Anyway, whatever they are called, it would seem that these segments do not 
require any of the syncing mechanisms that are causing you problems.


r~
