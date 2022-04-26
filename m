Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBB0C433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 26 Apr 2022 07:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qdibURt5ZGNFaZWhoC4Z1hrDOKY4P6Vm6TC5ak+1s6M=; b=Mgi97Tkm1Eeqzb
	jtGsgPjDU3kCqH0P9UOP2iMywqOq+BvT8izpF9YOcDhPparyoRwx/is7ZecWIambFtrsBGwUwP8Nr
	H5v7MtJ1VF0e53o41F5StJz3ixY1EYT3ZLNCL6qhN4xQtq5RBhohtwqpL7x+xbMSYf9oGy5pXdA7+
	sbJg7TT+WQDyhDuLVbHgp+tcpzbE7zx/mDr1qQl6Bs+jDpWE1995ll79it60uF5r9iyq8CmBYoaTS
	t2T1YP38RDxVP16oWvMa9d6pA50Ful3/Tnup3/S27yQE289wdhJjE7PS2f31ITWJRFTF2pWYGfl6k
	K5u3OCf7t8lbSd763k6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njFfa-00Cyi9-98; Tue, 26 Apr 2022 07:31:34 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njFfX-00CygO-QL
 for linux-snps-arc@lists.infradead.org; Tue, 26 Apr 2022 07:31:33 +0000
Received: by mail-lf1-x12f.google.com with SMTP id n14so9644799lfu.13
 for <linux-snps-arc@lists.infradead.org>; Tue, 26 Apr 2022 00:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QQ80ur6PlSUaWixcsaOAjCFW9B+zifvTSJBwIbbSTcM=;
 b=mFUHNDgK4kQzKNv2vtn+1t909sxO73bU0ERg8lVxj7n2UFEjlv/It8fcRiww9rYG0X
 GjcDFn97P4XRrldjCu44EMxnCWE/hScUhDYhas8P3MFoMLRaQFo3yo8lkHM8kn97QEmO
 2dbrarVSztgBDCH9ZX353ojQtG91khlbzON9rU6frUGw0on8uB27ikqo6n+C6aGOoG7y
 g3zVnGLkY2gHRMLDB/KX0Eix7KOp89e/M1oJR0ohhHiSMhsGFGPxf8KOM0uT7pZP+7Ah
 QHLSaF87dN9vqKnCByZp1DePb6UWHEifqSqvfvI1SLAX4LJoA6QEzEOyVemWjqeoRANI
 HppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QQ80ur6PlSUaWixcsaOAjCFW9B+zifvTSJBwIbbSTcM=;
 b=o+xh4vU2x/csKY4lLRn9BXDYb9hZOUvd7Zr9+bglLKif6RJz1eDAVHZFYfoI1Dzifq
 /eJHN/3mh1G41UcKBxa+jZ00Z5hIYyNjgYMpMjO/4FgSOVYheOgp1FMgwMxRXiWbg4pF
 CZQiseSbnZnXFF41T1NBVeIHhbqPG/7Kacw7wFCV3vGa3cJJZeEGZTTSPomSd10DEjtZ
 YbhNMMhJby20iibolw9yTPO4CO+/Qz4ADi/+mYarm51O4DT2lVuyBNuMN+QF74s7yht1
 9MZWSDKcXesLyBrIIXLOOP/sHapAPjpG5H8HvvIDH1NYF+0pdEqWgnHWJ1SYywZtLs9d
 QJ1g==
X-Gm-Message-State: AOAM530q6YmecmFYHwY4R+Smv+GqY6kOCJukHJmH0teArhplZDqpxxzQ
 Z+SDr8FZT/x0fRLLeudpjZxkle2pB7aI6g==
X-Google-Smtp-Source: ABdhPJwZEhCoDUjYm2e2WSblYDMSsYtJ+O/sfRiS5wEjID9c5kzVDoYY5HJum9x/tM1E4vsc+1fyEQ==
X-Received: by 2002:ac2:4218:0:b0:46b:925e:d2ba with SMTP id
 y24-20020ac24218000000b0046b925ed2bamr15720442lfh.396.1650958289529; 
 Tue, 26 Apr 2022 00:31:29 -0700 (PDT)
Received: from curiosity ([5.188.167.245]) by smtp.gmail.com with ESMTPSA id
 j8-20020a056512028800b004720b14e536sm538907lfp.237.2022.04.26.00.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 00:31:28 -0700 (PDT)
Date: Tue, 26 Apr 2022 10:31:28 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: kbuild-all@lists.01.org, Vineet Gupta <vgupta@kernel.org>
Subject: Re: [vgupta-arc:for-next 3/4] arch/arc/kernel/disasm.c:494:23:
 error: 'struct pt_regs' has no member named 'gp'; did you mean 'fp'?
Message-ID: <Ymef0FkwCE/hdUtb@curiosity>
References: <202204260826.d9fdltJm-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202204260826.d9fdltJm-lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_003131_915343_58D7E87F 
X-CRM114-Status: GOOD (  13.01  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


Hello Vineet,

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git for-next
> head:   e88856183749fd59759cd4c617f9ecec8280d8fa
> commit: b08a66fb680018b621fd8be641c537c625132ab3 [3/4] ARC: disasm: handle ARCv2 case in kprobe get/set functions
> config: arc-randconfig-r012-20220425 (https://download.01.org/0day-ci/archive/20220426/202204260826.d9fdltJm-lkp@intel.com/config)
> compiler: arceb-elf-gcc (GCC) 11.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/commit/?id=b08a66fb680018b621fd8be641c537c625132ab3
>         git remote add vgupta-arc https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git
>         git fetch --no-tags vgupta-arc for-next
>         git checkout b08a66fb680018b621fd8be641c537c625132ab3
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    arch/arc/kernel/disasm.c: In function 'disasm_instr':
>    arch/arc/kernel/disasm.c:28:19: warning: variable 'ins_ptr' set but not used [-Wunused-but-set-variable]
>       28 |         uint16_t *ins_ptr;
>          |                   ^~~~~~~
>    arch/arc/kernel/disasm.c: In function 'set_reg':
> >> arch/arc/kernel/disasm.c:494:23: error: 'struct pt_regs' has no member named 'gp'; did you mean 'fp'?
>      494 |                 regs->gp = val;
>          |                       ^~
>          |                       fp

I have just sent a fixup for this snafu:
https://lore.kernel.org/linux-snps-arc/20220426072447.125975-1-geomatsi@gmail.com/T/#u

IIUC, you have not yet sent a pull-request for next release. So probably
it makes sense to squash this commit with b08a66fb680018b6 ("ARC: disasm:
handle ARCv2 case in kprobe get/set functions").

Regards,
Sergey

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
