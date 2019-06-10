From: anshuman.khandual@arm.com (Anshuman Khandual)
Date: Mon, 10 Jun 2019 10:36:32 +0530
Subject: [RFC V3] mm: Generalize and rename notify_page_fault() as
 kprobe_page_fault()
In-Reply-To: <33c6a1cd-5c07-e623-28e5-f31f6fe30394@intel.com>
References: <1559903655-5609-1-git-send-email-anshuman.khandual@arm.com>
 <20190607201202.GA32656@bombadil.infradead.org>
 <f1b109a3-ef4c-359c-a124-e219e84a6266@arm.com>
 <33c6a1cd-5c07-e623-28e5-f31f6fe30394@intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <62aa0369-9542-17bc-034b-8445664c7c10@arm.com>
To: linux-snps-arc@lists.infradead.org



On 06/10/2019 10:27 AM, Dave Hansen wrote:
> On 6/9/19 9:34 PM, Anshuman Khandual wrote:
>>> Do you really think this is easier to read?
>>>
>>> Why not just move the x86 version to include/linux/kprobes.h, and replace
>>> the int with bool?
>> Will just return bool directly without an additional variable here as suggested
>> before. But for the conditional statement, I guess the proposed one here is more
>> compact than the x86 one.
> 
> FWIW, I don't think "compact" is generally a good goal for code.  Being
> readable is 100x more important than being compact and being un-compact
> is only a problem when it hurts readability.
> 
> For a function like the one in question, having the individual return
> conditions clearly commented is way more important than saving 10 lines
> of code.

Fair enough. Will keep the existing code flow from x86.
