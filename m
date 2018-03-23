From: blackzert@gmail.com (Ilya Smith)
Date: Fri, 23 Mar 2018 20:49:03 +0300
Subject: [RFC PATCH v2 2/2] Architecture defined limit on memory region
 random shift.
In-Reply-To: <20180322135448.046ada120ecd1ab3dd8f94aa@linux-foundation.org>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <1521736598-12812-3-git-send-email-blackzert@gmail.com>
 <20180322135448.046ada120ecd1ab3dd8f94aa@linux-foundation.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <548B6BB8-FD6F-4F8D-B67F-2809305C617D@gmail.com>
To: linux-snps-arc@lists.infradead.org


> On 22 Mar 2018,@23:54, Andrew Morton <akpm@linux-foundation.org> wrote:
> 
> 
> Please add changelogs.  An explanation of what a "limit on memory
> region random shift" is would be nice ;) Why does it exist, why are we
> doing this, etc.  Surely there's something to be said - at present this
> is just a lump of random code?
> 
> 
> 
Sorry, my bad. The main idea of this limit is to decrease possible memory 
fragmentation. This is not so big problem on 64bit process, but really big for 
32 bit processes since may cause failure memory allocation. To control memory 
fragmentation and protect 32 bit systems (or architectures) this limit was 
introduce by this patch. It could be also moved to CONFIG_ as well.
