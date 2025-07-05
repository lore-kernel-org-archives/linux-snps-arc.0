Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E590EC8303D
	for <linux-snps-arc@archiver.kernel.org>; Sat,  5 Jul 2025 07:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dx7KEVRIuozUVbt0WCtkmYjofOMSUHasdYfGVrXGyK0=; b=OkNdT7HFDbm2+b
	FJoo7dMdcD8g1r10v/Y1vOL1wA9wypr8S6IlO89gTPFlPWJs4AptL/EeivTz/3xbPto13bOlc2sPF
	4x5iNuRpl6Mr5LiO40TJBY7nHLkJtY1eMgQK8HtperIF/4f2geADqvt1o0FVzVoTuk+F+dxv0nYVO
	jAAW6XOlJd9Jnuc3bVsyV7UVnpAT0TUigJzWYRGg8wqTEuZlxetGljdO25S/WSMFCKOx1Z2KQo9W6
	9dAkdd0jsxC+VWIV0azP/zS4S/klqckRHYdJGLVTdo8ORSz6Co11C8flCnZw/pWC2xp5XUhj8i7fk
	JyL3itIj9+zl/5x32Wdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxRx-0000000GEF1-2oON;
	Sat, 05 Jul 2025 07:36:41 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxMM-0000000GDcE-2vbV
	for linux-snps-arc@lists.infradead.org;
	Sat, 05 Jul 2025 07:30:55 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2349f096605so21725045ad.3
        for <linux-snps-arc@lists.infradead.org>; Sat, 05 Jul 2025 00:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751700653; x=1752305453; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kmdrFnCGQGlfW9T+GcX8uPwJkq6p1K8BDyBOXN/hZ9Y=;
        b=XPhiczAtR/UFQr0oAElhKUq9/6dZgi9oGgUSlgnGVA8ueiYieLiFmL2TrSdcT8Dc9p
         ltJMgG4Bx9lAf34/A5XRmbyg4AmzQGI6L33BixJpD+1tB1fBVhEYu6/MUZYbFltAGMFZ
         bzYHlGIQdOtyW4/LNe+tJkKtEnKi+nzai5ZdOWdD76BdnVnFO3dRSe7eM1HtMPX1f3/Z
         Di2RSevDGYs1Rl4mmwBB+dU9dI8lALOsNTfBzm/ga65m2BMMsM/0N9iCQkau/sc9gpaM
         h6PaRRYa58XN0utiV6D7MsRNWvdDRqNLq3Ub66rOvae1mAKJI2s2onH4pXw//gvQZA6n
         MzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751700653; x=1752305453;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kmdrFnCGQGlfW9T+GcX8uPwJkq6p1K8BDyBOXN/hZ9Y=;
        b=xOFsGWZdy7NGjY9V3OJcZ6hkNjx0m+TVwTnWrJVs87TvTD73mCrfGQijOEeqEx7qoV
         mG9uL+lUBxoNwSf80JClbWY4MWKLRsaKKiY+/ed+c6MPhiPV1vTe4J4kqrMkW14+dPPF
         2khEpWsAZXdOv0qjntboDFLBj+zpPgdp/+dJIQlLITRUYVbVbBQkEnPkDF4iTlKj+PnK
         by30ELXD8XC1rMA1MLza3MbzWxbyiDid0ReCzk8shw60CqA84M7xkwERK/pg1hoF9aql
         Gsj2Hl6XYePl2nfZ/gmRxTcamC7yogAfJJvOB6Npzat4jR8sqZMZS3JP5UwUxoAnisez
         5M2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX+5oi1QTTi86dDE42kY45PnBcceCDY4+qM7CVl/7z3McmefLaIQbJzEE77mtMelNLEYW6dh4XNOur6fSTVBg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQB4NNqm6rdEgM0SpJhdML9o+DIMfXeIg69vPOjQt79AfMnSXk
	QkmBBqG2yxP9humbXCMWbsSgFOhpFlDugTo5S/yi+UFTSH6Oh8rBLi4C
X-Gm-Gg: ASbGncuMPkCZ6RDkoZaZO0PeHjqdgGAL8LDCCUxkLPmKyD99rklbGuXKHt90tJtkU8F
	1wYfo1H2xcPv8Gcr2XYB3sDYH9+wWz34zTZdoiT9XQBQExehRI5i8JMHK5W8fxObcfn24+LVob8
	yWnq1fvtENthRN2SmR5xmP33pIMGG6Dj8QDabXfnygA3FJR+Gsz67wgs3qrQGcLLkH/xd+jejfd
	kYIOkamwcnqZsMM+b7Hcn/OC/T+b3yPuVtJmxHE0ylMmwavUVFovivUiXmGYDmVZk0Ilrd1Lw39
	KkkN9oH5FXXlweCxy6NCvBgdoDEJlKHcsD+e4SzihX8GRKf7lU4NlLqE78GCohS09yYc6eYS
X-Google-Smtp-Source: AGHT+IE/04DPt7tUykh0udDgUo+PHx7RALY23hqiojGA+UTh4diHLWiAvsyqnxq2PSjlDNOouXdgow==
X-Received: by 2002:a17:902:d511:b0:237:ed38:a5b3 with SMTP id d9443c01a7336-23c8746d7eamr71697155ad.8.1751700653289;
        Sat, 05 Jul 2025 00:30:53 -0700 (PDT)
Received: from brak3rDesk ([115.96.219.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c84591cdcsm36002535ad.190.2025.07.05.00.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 00:30:52 -0700 (PDT)
Date: Sat, 5 Jul 2025 13:00:44 +0530
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
	namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, vgupta@kernel.org
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, skhan@linuxfoundation.org
Subject: [PATCH] arc:kernel:perf_event.c : replaced sprintf with sysfs_emit()
Message-ID: <aGjUpI1yNjEhSiAq@brak3rDesk>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_003054_736185_1919CAE9 
X-CRM114-Status: UNSURE (   9.32  )
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

Replaced sprintf() with sysfs_emit() in sysfs*_show() function in
perf_event.c file to follow the kernel's guidlines from
documentation/filesystems/sysfs.rst
This will improve consistency, safety, and makes it easier to maintain
and update in future.

Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
---
 arch/arc/kernel/perf_event.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/kernel/perf_event.c b/arch/arc/kernel/perf_event.c
index ed6d4f0cd621..424ec072c441 100644
--- a/arch/arc/kernel/perf_event.c
+++ b/arch/arc/kernel/perf_event.c
@@ -648,7 +648,7 @@ static ssize_t arc_pmu_events_sysfs_show(struct device *dev,
 	struct perf_pmu_events_attr *pmu_attr;
 
 	pmu_attr = container_of(attr, struct perf_pmu_events_attr, attr);
-	return sprintf(page, "event=0x%04llx\n", pmu_attr->id);
+	return sysfs_emit(page, "event=0x%04llx\n", pmu_attr->id);
 }
 
 /*
-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
