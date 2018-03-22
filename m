From: akpm@linux-foundation.org (Andrew Morton)
Date: Thu, 22 Mar 2018 13:57:29 -0700
Subject: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
In-Reply-To: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180322135729.dbfd3575819c92c0f88c5c21@linux-foundation.org>
To: linux-snps-arc@lists.infradead.org

On Thu, 22 Mar 2018 19:36:36 +0300 Ilya Smith <blackzert@gmail.com> wrote:

> Current implementation doesn't randomize address returned by mmap.
> All the entropy ends with choosing mmap_base_addr at the process
> creation. After that mmap build very predictable layout of address
> space. It allows to bypass ASLR in many cases.

Perhaps some more effort on the problem description would help.  *Are*
people predicting layouts at present?  What problems does this cause? 
How are they doing this and are there other approaches to solving the
problem?

Mainly: what value does this patchset have to our users?  This reader
is unable to determine that from the information which you have
provided.  Full details, please.
