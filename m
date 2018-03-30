From: blackzert@gmail.com (Ilya Smith)
Date: Fri, 30 Mar 2018 14:10:21 +0300
Subject: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
In-Reply-To: <20180330095735.GA15641@amd>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180330075508.GA21798@amd> <95EECC28-7349-4FB4-88BF-26E4CF087A0B@gmail.com>
 <20180330095735.GA15641@amd>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4F529F89-6595-4DE9-87C2-C3D971C76658@gmail.com>
To: linux-snps-arc@lists.infradead.org


> On 30 Mar 2018,@12:57, Pavel Machek <pavel@ucw.cz> wrote:
> 
> On Fri 2018-03-30 12:07:58, Ilya Smith wrote:
>> Hi
>> 
>>> On 30 Mar 2018,@10:55, Pavel Machek <pavel@ucw.cz> wrote:
>>> 
>>> Hi!
>>> 
>>>> Current implementation doesn't randomize address returned by mmap.
>>>> All the entropy ends with choosing mmap_base_addr at the process
>>>> creation. After that mmap build very predictable layout of address
>>>> space. It allows to bypass ASLR in many cases. This patch make
>>>> randomization of address on any mmap call.
>>> 
>>> How will this interact with people debugging their application, and
>>> getting different behaviours based on memory layout?
>>> 
>>> strace, strace again, get different results?
>>> 
>> 
>> Honestly I?m confused about your question. If the only one way for debugging 
>> application is to use predictable mmap behaviour, then something went wrong in 
>> this live and we should stop using computers at all.
> 
> I'm not saying "only way". I'm saying one way, and you are breaking
> that. There's advanced stuff like debuggers going "back in time".
> 

Correct me if I wrong, when you run gdb for instance and try to debug some 
application, gdb will disable randomization. This behaviour works with gdb 
command: set disable-randomization on. As I know, gdb remove flag PF_RANDOMIZE 
from current personality thats how it disables ASLR for debugging process. 
According to my patch, flag PF_RANDOMIZE is checked before calling 
unmapped_area_random. So I don?t breaking debugging. If you talking about the 
case, when your application crashes under customer environment and you want to
debug it; in this case layout of memory is what you don?t control at all and 
you have to understand what is where. So for debugging memory process layout is
not what you should care of.

Thanks,
Ilya
