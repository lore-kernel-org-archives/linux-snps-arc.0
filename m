From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 31 Jan 2019 17:48:22 -0800
Subject: [PATCH] make-syscalls.sh: fix comment referencing syscall-template
In-Reply-To: <f9e60218-9b8e-49aa-d61e-7c1c8cfc6441@redhat.com>
References: <1548980210-5289-1-git-send-email-vgupta@synopsys.com>
 <f9e60218-9b8e-49aa-d61e-7c1c8cfc6441@redhat.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <bf56d9a5-ca98-7ba7-b40f-363027c7406a@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 1/31/19 5:45 PM, Carlos O'Donell wrote:
> On 1/31/19 7:16 PM, Vineet Gupta wrote:
>> spotted when started working on ARC port to glibc
>>
>> ---
>>  ChangeLog                     | 5 +++++
>>  sysdeps/unix/make-syscalls.sh | 2 +-
>>  2 files changed, 6 insertions(+), 1 deletion(-)
>>
> Obviously correct :-)

Changelog is bigger than the fix ;-)

> Please commit to master which is open for development.
> 
> Reviewed-by: Carlos O'Donell <carlos at redhat.com>


I'm not sure if I have access credentials to commit to *the* glibc repo ?
