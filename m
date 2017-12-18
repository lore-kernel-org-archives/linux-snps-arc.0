From: wbx@uclibc-ng.org (Waldemar Brodkorb)
Date: Mon, 18 Dec 2017 20:40:42 +0100
Subject: [uclibc-ng-devel] [PATCH v2] Fix subtle race in tst-cancel2 /
 tst-cancelx2
In-Reply-To: <580c27f3-8f54-b141-f524-f9877f5f320d@synopsys.com>
References: <1512755276-1705-1-git-send-email-vgupta@synopsys.com>
 <1512756476-2452-1-git-send-email-vgupta@synopsys.com>
 <580c27f3-8f54-b141-f524-f9877f5f320d@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C5848F57-463F-4013-BC93-396E47D36C7F@uclibc-ng.org>
To: linux-snps-arc@lists.infradead.org

Hi,

patch applied and pushed,
just forgot the mail,

 best regards
  Waldemar 

> Am 18.12.2017 um 20:18 schrieb Vineet Gupta <Vineet.Gupta1 at synopsys.com>:
> 
>> On 12/08/2017 10:07 AM, Vineet Gupta wrote:
>> When ran on ARC, these tests would ocassionally fail
>> | [ARCLinux]# for i in 1 2 3 4 5 ; do ./tst-cancel2; echo $?; done
>> | write succeeded
>> | result is wrong: expected 0xffffffff, got 0x1
>> | 1                            <-- fail
>> | 0                            <-- pass
>> | 0                            <--- pass
>> | 0                            <-- pass
>> | write succeeded
>> | result is wrong: expected 0xffffffff, got 0x1
>> | 1                            <-- fail
>> Same test (which originated form glibc) doesn't fail in glibc builds.
>> Turns out there's a subtle race in uclibc version
>> The test creates a new thread, makes it do a looong write call, and
>> parent then cancels the thread, expecting it to unwind out of write
>> call cleanly. However the write (even for 10k bytes) could finish
>> before parent gets a chance to resume and/or cancel it, causing the
>> occasional failure.
>> Fix this subtelty by making it write not just once but forever.
>> Cc: Cupertino Miranda <cmiranda at synopsys.com>
>> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
>> ---
>> Change since v1: fix typos in changelogs
>> ---
> 
> Ping ?
> 
> 
>>  test/nptl/tst-cancel2.c | 6 +-----
>>  1 file changed, 1 insertion(+), 5 deletions(-)
>> diff --git a/test/nptl/tst-cancel2.c b/test/nptl/tst-cancel2.c
>> index 45c9e8ea957a..08dd13b10f37 100644
>> --- a/test/nptl/tst-cancel2.c
>> +++ b/test/nptl/tst-cancel2.c
>> @@ -32,11 +32,7 @@ tf (void *arg)
>>       write blocks.  */
>>    char buf[100000];
>>  -  if (write (fd[1], buf, sizeof (buf)) == sizeof (buf))
>> -    {
>> -      puts ("write succeeded");
>> -      return (void *) 1l;
>> -    }
>> +  while (write (fd[1], buf, sizeof (buf)) > 0);
>>      return (void *) 42l;
>>  }
> 
