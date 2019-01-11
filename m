From: anthony.yznaga@oracle.com (Anthony Yznaga)
Date: Thu, 10 Jan 2019 20:24:43 -0800
Subject: [PATCH 2/3] fs: inode_set_flags() replace opencoded
 set_mask_bits()
In-Reply-To: <1547166387-19785-3-git-send-email-vgupta@synopsys.com>
References: <1547166387-19785-1-git-send-email-vgupta@synopsys.com>
 <1547166387-19785-3-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5c9bf6bd-e29b-c985-b686-35f6dc272152@oracle.com>
To: linux-snps-arc@lists.infradead.org



On 1/10/19 4:26 PM, Vineet Gupta wrote:
> It seems that 5f16f3225b0624 and 00a1a053ebe5, both with same commitlog
> ("ext4: atomically set inode->i_flags in ext4_set_inode_flags()")
> introduced the set_mask_bits API, but somehow missed not using it in
> ext4 in the end
>
> Also, set_mask_bits is used in fs quite a bit and we can possibly come up
> with a generic llsc based implementation (w/o the cmpxchg loop)
>
> Cc: Alexander Viro <viro at zeniv.linux.org.uk>
> Cc: Theodore Ts'o <tytso at mit.edu>
> Cc: Peter Zijlstra (Intel) <peterz at infradead.org>
> Cc: linux-fsdevel at vger.kernel.org
> Cc: linux-kernel at vger.kernel.org
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
>

Reviewed-by: Anthony Yznaga <anthony.yznaga at oracle.com>
