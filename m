Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFF7C4167B
	for <linux-snps-arc@archiver.kernel.org>; Sat,  4 Nov 2023 09:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2+KsAPNk2MctUE4vdEv7vAERn29Y5rI2QguquebIo4g=; b=vdojsCDAdDItrA
	dUkEaB5lA21ZM4HLhnwaLFnkyEsgq3HyvjKKOeQjWyxVlBfqaH0F815mxyFDEAKRK11VLmOYQy38h
	mZscTWeLtwD3MJuhcDdcBiKN378LOPMYoIBbf1hfJI1ahoPx2G45BjNyZd5FqFWUHhPPNunVrqE/G
	5Hd80evdFjKer+/ZUTKvvrVBZNseNogDtrvVrCWJ/Z7M02Ot+BgxZkUOlk0+jhAXsMJk44BlReEbn
	mceMuiGNH790X/oFbNnWClKbRqv2JdQivGBDRMHu9cbMAZHGXfSQ0/TwCUdjTwz0TYqeL+hKl7bWM
	KVFnDSoeh6gYvuXmw9lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzClh-00CxjW-2q;
	Sat, 04 Nov 2023 09:16:37 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzCle-00Cxir-1a
	for linux-snps-arc@lists.infradead.org;
	Sat, 04 Nov 2023 09:16:36 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1cc1e1e74beso25464795ad.1
        for <linux-snps-arc@lists.infradead.org>; Sat, 04 Nov 2023 02:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1699089387; x=1699694187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SLNQXwvsmuV3fVIiwVg4eaHyhonWOyCC10q8MYVA8E8=;
        b=gSt37XP4JKsxgkOKQtE0HHoN76GSQ91M+zjjRPItZtu3/djVUKbFOJpGyuqB+/k++0
         PMZlfQQj1/XpvSWjNNgpHDTuc87vABjhLJ53M+uG/58ZgGw0k1lG0xiMmRFCUKJV6/Qm
         sYTFbgONTYeMNnN2TJI89LSLyqKEpyebhFzWWc/HnI2mkOcF9vXAu5nyF5nRLuKC+smn
         WuL83P5qDo27AjQBe+4EqHlYxAwNfX+U2Yf0z9znfZydlr72BmqPOSPJeT7phi0OgmgB
         r2uUnomopOLflmo4FPzqSlBFFa0yPEQ6ChBgLLuOmhofpRBsEdNAagQlHw0kgpIveaBd
         HbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699089387; x=1699694187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SLNQXwvsmuV3fVIiwVg4eaHyhonWOyCC10q8MYVA8E8=;
        b=k5RMp/RmK0amXsAgPu0vSR83wqdNqoptTzlnu1GtlQw1VRpbBHPJ2bGc0g/WVtDkM3
         sQU+D1wNCZBytIOB6sUW/iQ80RwWtmkSaq8sIHabTQGcNJRag+MgWGpCuXbn/HFM4J0Q
         hxCeeLB5WM+nRbk0dNZqonqI4AUjSIfB7C3k4IaogqWN6ddyXc9G7KwYcMFj3KPTXvfN
         le40oM96GKEGfy7iCyGWk37lRvzQXeVcRrWPn8IuO7NjFR499ZkL1Y3jMpWxJ0ruur/I
         9trF/IIhTIv7XRw5SIg4fMMEhZKHRF2ZBh2ZdFASlYMuzPxHYWsNy4pIUlGDblZwti7Z
         FXvw==
X-Gm-Message-State: AOJu0YwnA7jJ83iZatX7kloYhMcEfWjHf+UvGa7D/pUxQ/dlF97ygaCZ
	uRALSTQNbjYC3cTEKM1AavrgcQ==
X-Google-Smtp-Source: AGHT+IHbBh3J3IRfyxckxOWlsKX9sadU7+kPzJ+J9v34NvpVCI+Bhzyj9lMKHXCD1k0j5ZNgkIMKOQ==
X-Received: by 2002:a17:902:f213:b0:1bc:6c8:cded with SMTP id m19-20020a170902f21300b001bc06c8cdedmr22211228plc.67.1699089387534;
        Sat, 04 Nov 2023 02:16:27 -0700 (PDT)
Received: from devz1.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d4-20020a170903230400b001cc54202429sm2585127plh.288.2023.11.04.02.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 02:16:27 -0700 (PDT)
From: "wuqiang.matt" <wuqiang.matt@bytedance.com>
To: vgupta@kernel.org,
	bcain@quicinc.com,
	jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi,
	shorne@gmail.com,
	geert@linux-m68k.org,
	andi.shyti@linux.intel.com,
	mingo@kernel.org,
	palmer@rivosinc.com,
	andrzej.hajda@intel.com,
	arnd@arndb.de,
	peterz@infradead.orgm,
	mhiramat@kernel.org
Cc: linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	mattwu@163.com,
	linux@roeck-us.ne,
	"wuqiang.matt" <wuqiang.matt@bytedance.com>
Subject: [PATCH v2 0/4] locking/atomic: arch_cmpxchg[64]_local undefined
Date: Sat,  4 Nov 2023 17:16:11 +0800
Message-Id: <20231104091615.4884-1-wuqiang.matt@bytedance.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231104_021634_535013_24431D9E 
X-CRM114-Status: UNSURE (   5.59  )
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

This patch series implement arch_cmpxchg[64]_local for arc,
openrisc and hexagon.

For architectures that support native cmpxchg, we'd like to
implement arch_cmpxchg[64]_local with the native variants of
supported data size. If not, the generci_cmpxchg[64]_local
will be used.

wuqiang.matt (4):
  locking/atomic: arc: data size checking in arch_cmpxchg
  locking/atomic: arc: arch_cmpxchg[64]_local undefined
  locking/atomic: openrisc: arch_cmpxchg[64]_local undefined
  locking/atomic: hexagon: arch_cmpxchg[64]_local undefined

 arch/arc/include/asm/cmpxchg.h      | 40 ++++++++++++++++++----
 arch/hexagon/include/asm/cmpxchg.h  | 51 ++++++++++++++++++++++++++++-
 arch/openrisc/include/asm/cmpxchg.h |  6 ++++
 3 files changed, 90 insertions(+), 7 deletions(-)

-- 
2.40.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
