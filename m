From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 28 Jan 2016 14:20:37 +0000
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
Message-ID: <1453990837.4304.15.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Carlos,

On Thu, 2016-01-21@18:30 +0000, Carlos Palminha wrote:
> hi...
> 
> i just found that its blocking waiting for console_lock...
> @vineet, alexey: i think that console_lock is architecture dependent right? Do you know any issue with console_lock
> for ARC?

I'm not really sure "console_lock" has something to do with ARC architecture.
At least "git grep bconsole_lock" doesn't find anything in "arch/arc".

So I'd assume this is a generic thing.

-Alexey
