Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34831C61D85
	for <linux-snps-arc@archiver.kernel.org>; Tue, 21 Nov 2023 14:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YbgIQibncF+HTjSv9OCCShgmBO8Fn1pnGcFarJH5ZIY=; b=rXFez5cdF0/5Qw
	I9m4P8x9V+rH/ZbsjCG4z/UW/J0oCAZyRXKDW+dLwilP5hcu8PG9Dgomjh0mOipxVWaJxzbHHDkOV
	Q2rAoQFTbcloc0OLhYVysPseE/ZjOzqmoTZZTdLfqDVzr8kOjsQRusZxnD8tnXJxQDtwndsc8qC0A
	J1A+leV9EGbmqLkRIxUZCQVzkGkLg4lsnUeN7F6e3v3la6+nI4SeknMMDenvmSeZstg/0GxtFQefF
	h8aMvL1g/D+d8L4kz7q6YKylgYVl3kUIswXj/mWGo+PKun/eKBuflWK37kGabXC/Al4sI+MaBF8Y0
	hlaNVmcP7Sq4f39ANZlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5RgD-00H0me-1j;
	Tue, 21 Nov 2023 14:24:45 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5RgA-00H0ly-0z
	for linux-snps-arc@lists.infradead.org;
	Tue, 21 Nov 2023 14:24:44 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6c4d06b6ddaso4702018b3a.3
        for <linux-snps-arc@lists.infradead.org>; Tue, 21 Nov 2023 06:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1700576677; x=1701181477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rO5gvBC9Yj9Gj9iwFUnYV9+FlJPZ82+bI2tRklE6bkQ=;
        b=NV0J4FTLzoYO1+ioXxdAeg+SPBDK2/XWXLvmereAkleBEAS7gICdki8d1rmwFTfHQJ
         H/5XPbpOjvwyX4b/Q3ohIsFx6eI9SZneYZI0YUd8p6+n3BrW45UJnHm6HRsPSK8H4o4C
         H1Z8ixBe5esLMzp/JaCOtXWqKOBwtjV7f5gRy5R3c8wfgz7ev6Lf8REwrtHtBJlVsdr2
         gjajLBah8+N9BXcAPzVWdR+6nlxficLoJ0SFwglr3hglkVHWv1MKA6k8xOkcaJWcQtDL
         uK9J7ZrZZClLPoR3j9a4HMluwaycWPsgCECF+az5OYiUox+rJJ5u1ud7eN9iX5cSNHVn
         q+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700576677; x=1701181477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rO5gvBC9Yj9Gj9iwFUnYV9+FlJPZ82+bI2tRklE6bkQ=;
        b=ElgigruJh2sdg6AlWUhLAPtdpS9Lwes0O3MK1D+0VwgfI4dtDCJ1DMHlmBjpF0WaQ4
         QIwIvYnUAeyFZzsx3zIGZWiD6BzHHsiEhPaNjLd2dDsrXYn8MkiAaFuMRoZqc7ns3ahi
         i78KC+qx26QDVUTQzW5dbQolUw9EVpp6XghRl/xzR+ps5ewptq3rNc7nfrNv3cD0iEtt
         kOg61E3nuChifb4+CF57HGUkOpNy/DdkxlcmK4MhL1/0t1jn7+A05hbzaMqxvDg9K9+G
         EQZUfJDUkpXUpVTtV+OoSUMb473KmomJ2Q3N+MV1dDqa8IhyMU0eyhsyL+SZYTAto4gD
         lkaA==
X-Gm-Message-State: AOJu0Yy7Gh9nckM+WOsscLamwBTTtvmjNMagmBEOCasLJI/dqrLU5Dz3
	mu9Fo9i06jpGv57SBQyjtYS5Cg==
X-Google-Smtp-Source: AGHT+IGZ0cj3qTxHGElldELTLLVk70f7H8QJHy0DgUxvrRtGVlmmImJxGtalz8fEj5aiHrvaElF8fg==
X-Received: by 2002:a05:6a20:1591:b0:18a:716d:4ac with SMTP id h17-20020a056a20159100b0018a716d04acmr6231274pzj.47.1700576677576;
        Tue, 21 Nov 2023 06:24:37 -0800 (PST)
Received: from devz1.bytedance.net ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id d13-20020a056a00244d00b0068842ebfd10sm7923193pfj.160.2023.11.21.06.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 06:24:36 -0800 (PST)
From: "wuqiang.matt" <wuqiang.matt@bytedance.com>
To: ubizjak@gmail.com,
	mark.rutland@arm.com,
	vgupta@kernel.org,
	bcain@quicinc.com,
	jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi,
	shorne@gmail.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	geert@linux-m68k.org,
	andi.shyti@linux.intel.com,
	mingo@kernel.org,
	palmer@rivosinc.com,
	andrzej.hajda@intel.com,
	arnd@arndb.de,
	peterz@infradead.org,
	mhiramat@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	mattwu@163.com,
	linux@roeck-us.net,
	"wuqiang.matt" <wuqiang.matt@bytedance.com>
Subject: [PATCH v3 0/5] arch,locking/atomic: add arch_cmpxchg[64]_local
Date: Tue, 21 Nov 2023 22:23:42 +0800
Message-Id: <20231121142347.241356-1-wuqiang.matt@bytedance.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_062442_461697_B53EAF94 
X-CRM114-Status: UNSURE (   6.20  )
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

Archtectures arc, openrisc and hexagon haven't arch_cmpxchg_local()
defined, so the usecase of try_cmpxchg_local() in lib/objpool.c can
not pass kernel building by the kernel test robot.

Patch 1 improves the data size checking logic for arc; Patches 2/3/4
implement arch_cmpxchg[64]_local for arc/openrisc/hexagon. Patch 5
defines arch_cmpxchg_local as existing __cmpxchg_local rather the
generic variant.

wuqiang.matt (5):
  arch,locking/atomic: arc: arch_cmpxchg should check data size
  arch,locking/atomic: arc: add arch_cmpxchg[64]_local
  arch,locking/atomic: openrisc: add arch_cmpxchg[64]_local
  arch,locking/atomic: hexagon: add arch_cmpxchg[64]_local
  arch,locking/atomic: xtensa: define arch_cmpxchg_local as
    __cmpxchg_local

 arch/arc/include/asm/cmpxchg.h      | 40 ++++++++++++++++++----
 arch/hexagon/include/asm/cmpxchg.h  | 51 ++++++++++++++++++++++++++++-
 arch/openrisc/include/asm/cmpxchg.h |  6 ++++
 arch/xtensa/include/asm/cmpxchg.h   |  2 +-
 4 files changed, 91 insertions(+), 8 deletions(-)

-- 
2.40.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
