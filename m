From: blackzert@gmail.com (Ilya Smith)
Date: Fri, 23 Mar 2018 20:25:15 +0300
Subject: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
In-Reply-To: <20180322135729.dbfd3575819c92c0f88c5c21@linux-foundation.org>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180322135729.dbfd3575819c92c0f88c5c21@linux-foundation.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C43F853F-6B54-42DF-AEF2-64B22DAB8A1D@gmail.com>
To: linux-snps-arc@lists.infradead.org

Hello, Andrew

Thanks for reading this patch.

> On 22 Mar 2018,@23:57, Andrew Morton <akpm@linux-foundation.org> wrote:
> 
> On Thu, 22 Mar 2018 19:36:36 +0300 Ilya Smith <blackzert@gmail.com> wrote:
> 
>> Current implementation doesn't randomize address returned by mmap.
>> All the entropy ends with choosing mmap_base_addr at the process
>> creation. After that mmap build very predictable layout of address
>> space. It allows to bypass ASLR in many cases.
> 
> Perhaps some more effort on the problem description would help.  *Are*
> people predicting layouts at present?  What problems does this cause? 
> How are they doing this and are there other approaches to solving the
> problem?
> 
Sorry, I?ve lost it in first version. In short - memory layout could be easily 
repaired by single leakage. Also any Out of Bounds error may easily be 
exploited according to current implementation. All because mmap choose address 
just before previously allocated segment. You can read more about it here: 
http://www.openwall.com/lists/oss-security/2018/02/27/5
Some test are available here https://github.com/blackzert/aslur. 
To solve the problem Kernel should randomize address on any mmap so
attacker could never easily gain needed addresses.

> Mainly: what value does this patchset have to our users?  This reader
> is unable to determine that from the information which you have
> provided.  Full details, please.

The value of this patch is to decrease successful rate of exploitation
vulnerable applications.These could be either remote or local vectors.
