From: daniel@fooishbar.org (Daniel Stone)
Date: Fri, 22 Jan 2016 08:32:13 +0000
Subject: Whats missing in my new FB DRM driver in ARC... waiting for
 console_lock to return
In-Reply-To: <56A123CD.1060706@synopsys.com>
References: <5684268E.2000607@synopsys.com>
 <CAGd==071hzpQKjLU715tc004NN0d8Z01XdLAhg-DBx1FxtWb2w@mail.gmail.com>
 <569CF78F.7050303@synopsys.com> <569CFA9B.4060108@synopsys.com>
 <CAGd==07ffJAfAtzirALR3OF7f4UDVu_fJbbZ0ZiEa3F5-hLfyw@mail.gmail.com>
 <569E5E51.8000303@synopsys.com> <569E69EB.3010003@synopsys.com>
 <CAGd==04VMKUvb6hZkeNw3kAQt04y0d_Ry7oCtC8=2SWcfWG25A@mail.gmail.com>
 <56A11EF1.3070004@synopsys.com> <56A123CD.1060706@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAPj87rMTLYiEG=4=P9D9kS1eC2BU5dL-4XjKncXanz79E-EutQ@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

Hi,

On 21 January 2016 at 18:30, Carlos Palminha
<CARLOS.PALMINHA@synopsys.com> wrote:
> i just found that its blocking waiting for console_lock...
> @vineet, alexey: i think that console_lock is architecture dependent right? Do you know any issue with console_lock for ARC?

Once console_lock is acquired, you will not see any further prints
whilst it is held. Likely your driver is hanging/crashing whilst
holding console_lock, which you don't see. See the patch just sent to
the list to document how to debug issues which happen under
console_lock.

Cheers,
Daniel
