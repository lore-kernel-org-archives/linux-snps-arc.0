From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 19 Sep 2018 18:46:04 +0000
Subject: [PATCH libgpg-error] syscfg: Add ARC architecture
References: <20180917051401.11358-1-abrodkin@synopsys.com>
 <878t3ztiif.fsf@wheatstone.g10code.de>
 <e563c80e70dd56fed924be3097a51370cb121868.camel@synopsys.com>
 <8736u7t0vm.fsf@wheatstone.g10code.de>
 <4de08347a84dabdab577e02bf3702dc8c9eb769b.camel@synopsys.com>
 <87sh26st3i.fsf@wheatstone.g10code.de>
 <45de4a5495aa029bc6299b63452889ce829a82bf.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075012B095AC0@us01wembx1.internal.synopsys.com>
 <87musdsoxl.fsf@wheatstone.g10code.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075012B095D12@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 09/19/2018 04:44 AM, Werner Koch wrote:
> On Tue, 18 Sep 2018 21:34, Vineet.Gupta1 at synopsys.com said:
>
>> I'm not exactly clear what the question is ? What is specific in ABI related to
>> locks ?
> Libgpg-error abstracts the native lock interface and thus needs to get
> some information on the actual implementation.  It can very well be the
> case that the big-endian ABI is different from the little endian ABI.
> In particular the static initialization may be different; this is
> implemented in libgpg-error using a macro which may look like this
>
>   #define GPGRT_LOCK_INITIALIZER {1,{{167,171,170,50,0,0,0,0, \
>   0,0,0,0,0,0,0,0, \
>   0,0,0,0,0,0,0,0, \
>   0,0,0,0,0,0,0,0, \
>   0,0,0,0,0,0,0,0, \
>   0,0,0,0,0,0,0,0, \
>   0,0,0,0,0,0,0,0, \
>   0,0,0,0,0,0,0,0}}}
>
> This is an memory image and we can't make use of C data types because
> we don't know them.

Well BE will certainly be different than LE.
Back to the original discussion, was the question about glibc vs. uClibc pthread
ABI ? Since they are different / independent implementations (even if uClibc is
sort of copy over from glibc) we can't guarantee that these would the same so each
would need a specific initializer I guess.

-Vineet
