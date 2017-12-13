From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 13 Dec 2017 21:46:26 +0000
Subject: [PATCH v2] arch: define weak abort
In-Reply-To: <1513118956-8718-1-git-send-email-sudipm.mukherjee@gmail.com>
References: <1513118956-8718-1-git-send-email-sudipm.mukherjee@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1513201585.9373.21.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Sudip,

On Tue, 2017-12-12@22:49 +0000, Sudip Mukherjee wrote:
> gcc toggle -fisolate-erroneous-paths-dereference (default at -O2
> onwards) isolates faulty code paths such as null pointer access, divide
> by zero etc. If gcc port doesnt implement __builtin_trap, an abort() is
> generated which causes kernel link error.
> 
> In this case, gcc is generating abort due to 'divide by zero' in
> lib/mpi/mpih-div.c.
> 
> Currently 'frv' and 'arc' are failing. Previously other arch was also
> broken like m32r was fixed by d22e3d69ee1a ("m32r: fix build failure").
> 
> Lets define this weak function which is common for all arch and fix the
> problem permanently. We can even remove the arch specific 'abort' after
> this is done.
> 
> Cc: Alexey Brodkin <Alexey.Brodkin at synopsys.com>
> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee at gmail.com>
> ---
> 
> Hi Alexey,
> I was thinking of sending the m32r revert patch in few days. My m32r
> builds are having a little problem and should be fixed by this weekend.
> I can not test m32r before that.

Understood, that's fine by me.

> We can also send a patch to remove the
> same code in arm and unicore32.

Sure that would be really great!

-Alexey
