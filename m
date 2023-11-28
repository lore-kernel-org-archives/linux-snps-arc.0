Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFC2C4167B
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Nov 2023 06:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gbd0gC3pu40g8VwlICY1InREPu1d7Lw49gKQ3y4pswI=; b=QBCt0g9WRYUpg1
	9QvvY19zpVBaQ4lw6LbFapy6ezAwZ1X3wnGIR4iWo/mEV4yzHAlYjZKVXcOQq5+HhHHsZgMqBgBly
	hWaOlOzpdYuebt+tXiJIqG/OTBSrSdlNKwN45qREbdu+m0sJba4MtCnULs9bpft6j5MlQ2fBsmlSy
	ql0QvWfA2uBiLgM/6i41XN4pU8QjXK48bq/qReGj4ALd5xrDTLakUsxG17wMPsVFcdHT44pUYjo40
	9Tv4sbYNdjnoNQoy8Z01x8n3c6/y2XNk6kdDK3WHMviXWG+WFBFzne92HLoSlu55YUmsMBdZ8BlUC
	X6r12m6XbIIqPmuAQOYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7rUp-004Fhh-2J;
	Tue, 28 Nov 2023 06:22:59 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7rUl-004Fgk-2e
	for linux-snps-arc@lists.infradead.org;
	Tue, 28 Nov 2023 06:22:57 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3330fd19820so101235f8f.1
        for <linux-snps-arc@lists.infradead.org>; Mon, 27 Nov 2023 22:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701152574; x=1701757374; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hPtGbvFvbBhWiAO0KqjHdk9TS5G0CVYCi0szrUGqbGw=;
        b=GyGNUuYMUSiQwTUre1FV+HyglxeWmzMd4geFtS20hTfwLAsb7pAhdoF8UDOdG1chmu
         ZlWEjXYjQWpEkpGgvIQXZl5PpiBuQ9NwT8bDY9pcznHjISKyAYw56NcYep80bi6wPr+a
         xsw8IVgQdSEMxW8bCF61UzfM/6CNWj5bg7/MsOJSGLj5d4geZUKXPXI8HnKQiwUemXjO
         0ww9ravqjfHGRhWe2u03tFnEhNlQ8ZOga5/2o6Z6jDNHKTMFPS1dKKw1M2RsZkBMxf6O
         ra4u5NY4jL7uevfUQ47a+wvO1byO6xpqJvJFsWbMV5IbxjmNcX53+PBb5eW5NdevaA/t
         Wvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701152574; x=1701757374;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hPtGbvFvbBhWiAO0KqjHdk9TS5G0CVYCi0szrUGqbGw=;
        b=DHr3uMLffJ31q957xyJHqVH8Uj4jDXov4MZkaPXmYFu/Q/x71DhNXRe4KKlfqXRdU+
         PnBNs7f85NdWXd6qefF+xm16H+RWNvsVpyS80MtJCv3cTL5EsXHLUA36fsxMAmv/WZyq
         aj8pgR2ECYEjetQC6mWj/9zGv9LtcRQKMuq++Pe2c3AEg13zYi+K8f1AHZrCc9AurExn
         OqGncjgwq/LqAvtzwLb+RD+cu+ypmlMQ/x67HkyfFTXgnnZqdWnAO7tSFofZEmI2z08V
         HAEn4Izyj4bGXf0cNtVfzeF6JBL4Su9ww+3grojriptp6NLOO1wjF0DoIrQT0zRtX2/e
         /UYw==
X-Gm-Message-State: AOJu0YydWL99Fo/ZSLcXF1iDsOk4rs1VPzjcLjAn0uItuN0wN11XCFzn
	wwLc2k95W3Swj8DznCA8zPCePg==
X-Google-Smtp-Source: AGHT+IGRijsPwnlyl6qa4iz/DeWVhs98fC2QMwxlyhHJ3pF2UrZX/B6n/FQm2E9DtShpemgAFYyWOQ==
X-Received: by 2002:adf:f503:0:b0:332:fa75:a8ee with SMTP id q3-20020adff503000000b00332fa75a8eemr5275830wro.33.1701152573933;
        Mon, 27 Nov 2023 22:22:53 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e5-20020adfe7c5000000b0033307ffb193sm2760534wrn.29.2023.11.27.22.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 22:22:53 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 28 Nov 2023 09:22:50 +0300
To: oe-kbuild@lists.linux.dev, Vineet Gupta <vgupta@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org
Subject: arch/arc/kernel/setup.c:203 arcv2_mumbojumbo() error: uninitialized
 symbol 'release'.
Message-ID: <c2148229-bea9-40ef-bbf3-6019555f3f1a@suswa.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_222255_864402_2B7A5A70 
X-CRM114-Status: UNSURE (   7.81  )
X-CRM114-Notice: Please train this message.
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2cc14f52aeb78ce3f29677c2de1f06c0e91471ab
commit: fad84e39f116035ae8d550c6020107b8ac113b45 ARC: boot log: eliminate struct cpuinfo_arc #4: boot log per ISA
config: arc-randconfig-r071-20231128 (https://download.01.org/0day-ci/archive/20231128/202311280906.VAIwEAfT-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231128/202311280906.VAIwEAfT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311280906.VAIwEAfT-lkp@intel.com/

New smatch warnings:
arch/arc/kernel/setup.c:203 arcv2_mumbojumbo() error: uninitialized symbol 'release'.

Old smatch warnings:
arch/arc/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.

vim +/release +203 arch/arc/kernel/setup.c

fad84e39f11603 Vineet Gupta 2020-06-11  150  static int arcv2_mumbojumbo(int c, struct cpuinfo_arc *info, char *buf, int len)
fad84e39f11603 Vineet Gupta 2020-06-11  151  {
fad84e39f11603 Vineet Gupta 2020-06-11  152  	int n = 0;
fad84e39f11603 Vineet Gupta 2020-06-11  153  #ifdef CONFIG_ISA_ARCV2
fad84e39f11603 Vineet Gupta 2020-06-11  154  	const char *release, *cpu_nm, *isa_nm = "ARCv2";
fad84e39f11603 Vineet Gupta 2020-06-11  155  	int dual_issue = 0, dual_enb = 0, mpy_opt, present;
fad84e39f11603 Vineet Gupta 2020-06-11  156  	int bpu_full, bpu_cache, bpu_pred, bpu_ret_stk;
fad84e39f11603 Vineet Gupta 2020-06-11  157  	char mpy_nm[16], lpb_nm[32];
fad84e39f11603 Vineet Gupta 2020-06-11  158  	struct bcr_isa_arcv2 isa;
fad84e39f11603 Vineet Gupta 2020-06-11  159  	struct bcr_mpy mpy;
fad84e39f11603 Vineet Gupta 2020-06-11  160  	struct bcr_fp_arcv2 fpu;
fad84e39f11603 Vineet Gupta 2020-06-11  161  	struct bcr_bpu_arcv2 bpu;
fad84e39f11603 Vineet Gupta 2020-06-11  162  	struct bcr_lpb lpb;
fad84e39f11603 Vineet Gupta 2020-06-11  163  	struct bcr_iccm_arcv2 iccm;
fad84e39f11603 Vineet Gupta 2020-06-11  164  	struct bcr_dccm_arcv2 dccm;
fad84e39f11603 Vineet Gupta 2020-06-11  165  	struct bcr_erp erp;
00a4ae65cc600b Vineet Gupta 2019-02-25  166  
00a4ae65cc600b Vineet Gupta 2019-02-25  167  	/*
97d0b5d0b5a998 Vineet Gupta 2020-06-10  168  	 * Initial HS cores bumped AUX IDENTITY.ARCVER for each release until
97d0b5d0b5a998 Vineet Gupta 2020-06-10  169  	 * ARCVER 0x54 which introduced AUX MICRO_ARCH_BUILD and subsequent
97d0b5d0b5a998 Vineet Gupta 2020-06-10  170  	 * releases only update it.
00a4ae65cc600b Vineet Gupta 2019-02-25  171  	 */
00a4ae65cc600b Vineet Gupta 2019-02-25  172  
fad84e39f11603 Vineet Gupta 2020-06-11  173  	cpu_nm = "HS38";
00a4ae65cc600b Vineet Gupta 2019-02-25  174  
fad84e39f11603 Vineet Gupta 2020-06-11  175  	if (info->arcver > 0x50 && info->arcver <= 0x53) {
fad84e39f11603 Vineet Gupta 2020-06-11  176  		release = arc_hs_rel[info->arcver - 0x51].str;
00a4ae65cc600b Vineet Gupta 2019-02-25  177  	} else {
fad84e39f11603 Vineet Gupta 2020-06-11  178  		const struct id_to_str *tbl;
fad84e39f11603 Vineet Gupta 2020-06-11  179  		struct bcr_uarch_build uarch;
fad84e39f11603 Vineet Gupta 2020-06-11  180  
fad84e39f11603 Vineet Gupta 2020-06-11  181  		READ_BCR(ARC_REG_MICRO_ARCH_BCR, uarch);
00a4ae65cc600b Vineet Gupta 2019-02-25  182  
97d0b5d0b5a998 Vineet Gupta 2020-06-10  183  		for (tbl = &arc_hs_ver54_rel[0]; tbl->id != 0xFF; tbl++) {
00a4ae65cc600b Vineet Gupta 2019-02-25  184  			if (uarch.maj == tbl->id) {
fad84e39f11603 Vineet Gupta 2020-06-11  185  				release = tbl->str;

Will we always hit this assignment?

d975cbc8acb6f4 Vineet Gupta 2016-10-27  186  				break;
d975cbc8acb6f4 Vineet Gupta 2016-10-27  187  			}
00a4ae65cc600b Vineet Gupta 2019-02-25  188  		}
fad84e39f11603 Vineet Gupta 2020-06-11  189  		if (uarch.prod == 4) {
fad84e39f11603 Vineet Gupta 2020-06-11  190  			unsigned int exec_ctrl;
00a4ae65cc600b Vineet Gupta 2019-02-25  191  
fad84e39f11603 Vineet Gupta 2020-06-11  192  			cpu_nm = "HS48";
fad84e39f11603 Vineet Gupta 2020-06-11  193  			dual_issue = 1;
fad84e39f11603 Vineet Gupta 2020-06-11  194  			/* if dual issue hardware, is it enabled ? */
fad84e39f11603 Vineet Gupta 2020-06-11  195  			READ_BCR(AUX_EXEC_CTRL, exec_ctrl);
fad84e39f11603 Vineet Gupta 2020-06-11  196  			dual_enb = !(exec_ctrl & 1);
fad84e39f11603 Vineet Gupta 2020-06-11  197  		}
fad84e39f11603 Vineet Gupta 2020-06-11  198  	}
73e284d2572581 Vineet Gupta 2016-10-20  199  
fad84e39f11603 Vineet Gupta 2020-06-11  200  	READ_BCR(ARC_REG_ISA_CFG_BCR, isa);
b89bd1f4fbaeca Vineet Gupta 2016-01-22  201  
fad84e39f11603 Vineet Gupta 2020-06-11  202  	n += scnprintf(buf + n, len - n, "processor [%d]\t: %s %s (%s ISA) %s%s%s\n",
fad84e39f11603 Vineet Gupta 2020-06-11 @203  		       c, cpu_nm, release, isa_nm,
fad84e39f11603 Vineet Gupta 2020-06-11  204  		       IS_AVAIL1(isa.be, "[Big-Endian]"),
fad84e39f11603 Vineet Gupta 2020-06-11  205  		       IS_AVAIL3(dual_issue, dual_enb, " Dual-Issue "));
af61742813aa9d Vineet Gupta 2013-01-18  206  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
