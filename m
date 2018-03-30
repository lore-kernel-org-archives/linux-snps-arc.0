From: blackzert@gmail.com (Ilya Smith)
Date: Fri, 30 Mar 2018 12:07:58 +0300
Subject: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
In-Reply-To: <20180330075508.GA21798@amd>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180330075508.GA21798@amd>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <95EECC28-7349-4FB4-88BF-26E4CF087A0B@gmail.com>
To: linux-snps-arc@lists.infradead.org

Hi

> On 30 Mar 2018,@10:55, Pavel Machek <pavel@ucw.cz> wrote:
> 
> Hi!
> 
>> Current implementation doesn't randomize address returned by mmap.
>> All the entropy ends with choosing mmap_base_addr at the process
>> creation. After that mmap build very predictable layout of address
>> space. It allows to bypass ASLR in many cases. This patch make
>> randomization of address on any mmap call.
> 
> How will this interact with people debugging their application, and
> getting different behaviours based on memory layout?
> 
> strace, strace again, get different results?
> 

Honestly I?m confused about your question. If the only one way for debugging 
application is to use predictable mmap behaviour, then something went wrong in 
this live and we should stop using computers at all.

Thanks,
Ilya
