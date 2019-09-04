From: ebiederm@xmission.com (Eric W. Biederman)
Date: Wed, 04 Sep 2019 11:41:55 -0500
Subject: [PATCH AUTOSEL 4.19 111/167] signal/arc: Use force_sig_fault
 where appropriate
In-Reply-To: <20190903194526.GH5281@sasha-vm> (Sasha Levin's message of "Tue,
 3 Sep 2019 15:45:26 -0400")
References: <20190903162519.7136-1-sashal@kernel.org>
 <20190903162519.7136-111-sashal@kernel.org>
 <87ef0xqq9f.fsf@x220.int.ebiederm.org>
 <20190903194526.GH5281@sasha-vm>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <87y2z4nhd8.fsf@x220.int.ebiederm.org>
To: linux-snps-arc@lists.infradead.org

Sasha Levin <sashal at kernel.org> writes:

> On Tue, Sep 03, 2019@11:49:16AM -0500, Eric W. Biederman wrote:
>>Sasha Levin <sashal at kernel.org> writes:
>>
>>> From: "Eric W. Biederman" <ebiederm at xmission.com>
>>>
>>> [ Upstream commit 15773ae938d8d93d982461990bebad6e1d7a1830 ]
>>
>>To the best of my knowledge this is just a clean up, no changes in
>>behavior are present.
>>
>>The only reason I can see to backport this is so that later fixes could
>>be applied cleanly.
>>
>>So while I have no objections to this patch being backported I don't see
>>why you would want to either.
>
> This patch along with the next one came in as a dependency for
> a8c715b4dd73c ("ARC: mm: SIGSEGV userspace trying to access kernel
> virtual memory").

Thanks for providing the rest of the context.

That looks like a perfect reason for backporting this patch.

Eric
