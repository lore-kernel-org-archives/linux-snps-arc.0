Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355FBE7717D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Dec 2024 15:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HBYphgTnw1vNqdVR/Zu8NAoFiR46SOXJ2cjZRDLLzAQ=; b=IV5w72sds+J+wI
	2G956I+aBIWqxYpDLZc72ibtoZMHQoLbgFVMT0YsI2TFYnCs/pZh5oaSoNm3V5vb9VVwb2AVkdATk
	ALF6br/9AS04KV7oDFoY5ZzHWStanKtYfcnjLpwo/+VsQ5r8mkWXjMd7Hi0UYmVcShxnqfVcaNTEY
	c/FJColjL+YKQWkgD6djJY2dIepaGuK8lf0tfY/8PyyOjR9SCBLq463bRbOOgtVn1mDbNJuQb2qxP
	iI+zMrSw6wm4O2d4vqnP2Bxu1Ant8oPRpIrfOYo+H8q1W20dDRx5PmlugOuJzlgZBViiId6dJL1J8
	L7qv8RSPopNe35ayOc+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM7Pp-00000004FDp-3qN5;
	Fri, 13 Dec 2024 15:17:17 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM7Pn-00000004FD2-0Ihr;
	Fri, 13 Dec 2024 15:17:16 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDDjq93022538;
	Fri, 13 Dec 2024 15:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=p2iBZ39DA1heYV2DZTywte70NmnmJJrjfQsQLvksWV8=; b=
	l8kwmgbCyfwID1zP500UUVjej1s4KSt8C7hACK3L6KhIvDenB49ydXUJcLioDmGP
	o/Rc4pXegfBDl73F+wNadat7lgeU2IY0wAWIgbd/vIfJSqwt7/cXZAYQDZPFug9l
	39vcLSOelDobOG6t5rAhH8dXsZvkMEbCobVf7BTqMF2jH7+4X+LZVBGTxPHJa6tM
	tV5OP/wqH24q8CobqflkCPOsibd6rmZKuHD85QL5XvtUew6D1sZuMD+D4e1gr6Ix
	exjMKkA9SFwImtZAVztdTWajoIaAM7delNEZH4U94ASZSgRkdvsVU46X5M/F6m2e
	Y2F2z4RDdrocsTKbxo8RpA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43ce89de1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Dec 2024 15:16:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDERs4m038157;
	Fri, 13 Dec 2024 15:16:31 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43cctk6xnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Dec 2024 15:16:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZH4vdj1XQH7GqpWmUAE00CCpbbiwnK5xEwmaBv6OPzZmAXHqplgJAVw/6zanqjdgMDwnmdpmPNIz/6sj0AhaOV6Cl1qRAIR8UnIEPJUp+OcgEXQf7Y5bJ0KHwgGqucas8E42eSJRpi63yNlu35Gz5aJqhWOBEMjTS+5uneRye3EZ2bezRtXUp5ajpcfrQL7w/X3SEkFYSvtq/MOKktZf/2O4RVYBwi/San07PTp1sJeyM8jMMH+CN0MTbeoZ0BT+3XtCHlvMhP350XHl/xNlN17hMGoMrBMN5aWlxa4uXbgGPLtRtlAO8Oaf30MwBJKXYqhecsJjQADdGcgomwLtHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2iBZ39DA1heYV2DZTywte70NmnmJJrjfQsQLvksWV8=;
 b=SRA2pGLzkDbAUFK2uvKwKSXnio0gxIlYKNgjToUan3x+pnmi3iXfF/tZpQ4g7frPl3XgtV28xh3pInTK8iu7TG+L88YcRW4QZaq9TovkbXA1IhngSKXKu66h9Jgwas8MFhi2zL29fl6E53BZwEds1CMi8Ki6faHuhdShjFdGbx4d1L+ZKqKt9dkhxttDPCP46RFHbJHz+lpF4C3IGvlUIJUFdLP7v6LT8xk1n+1lR0rZ5D6g+3GkNv3BahRbJ9sQ0op6ZtpITtQo1/cX2rtGe/Wo+tp13GnqHPuPjxPEeZDA5RiZuqWdv3xzjEunsQDLpa6xp5TE+BZMRuSKxEi7ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2iBZ39DA1heYV2DZTywte70NmnmJJrjfQsQLvksWV8=;
 b=BInhiLZb+C8EhaiqbGNnh/5N+rGFh4bvuLpSCH0pcuxgIf4dnJr8ZDqfY4cUt2n4Bzb+2scipyuggbCvgs8nr1Zln2GL8J40nVMKj43mdrY4vbQ/k+nmWBD++x4fNzksAf7NkNktSVRJ3KdSUDDAdKrBXDFEU6P+hLl4+g3ZmUE=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by IA0PR10MB7327.namprd10.prod.outlook.com (2603:10b6:208:40e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 15:16:28 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%7]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 15:16:28 +0000
Date: Fri, 13 Dec 2024 15:16:23 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Kalesh Singh <kaleshsingh@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>, vbabka@suse.cz,
        yang@os.amperecomputing.com, riel@surriel.com, david@redhat.com,
        minchan@kernel.org, jyescas@google.com, linux@armlinux.org.uk,
        tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, davem@davemloft.net, andreas@gaisler.com,
        tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
        x86@kernel.org, chris@zankel.net, jcmvbkbc@gmail.com,
        bhelgaas@google.com, jason.andryuk@amd.com, leitao@debian.org,
        linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-mm@kvack.org,
        kernel-team@android.com, android-mm@google.com,
        Jann Horn <jannh@google.com>
Subject: Re: [PATCH mm-unstable v2 00/16] mm: Introduce arch_mmap_hint()
Message-ID: <9675c409-b495-46a5-a90c-c952892b4121@lucifer.local>
References: <20241211232754.1583023-1-kaleshsingh@google.com>
 <hmuzfspqjzb36xlj2x44keihacrrhzj5madqrfbcnhqouzredv@wo75achgkuh5>
 <1818e2ea-f170-4a9c-8d93-2a24f2755a41@lucifer.local>
 <20241212173609.afd41d1dffbefe0d731ed4ed@linux-foundation.org>
 <695eabb8-ba28-4031-bc4d-66dc4f1d096f@lucifer.local>
 <CAC_TJvcdz854DmBoVRkb_B5j+u-t=4zHkLtHVeB5RJ=bXcBJag@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAC_TJvcdz854DmBoVRkb_B5j+u-t=4zHkLtHVeB5RJ=bXcBJag@mail.gmail.com>
X-ClientProxiedBy: LNXP265CA0096.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::36) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|IA0PR10MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a139600-7006-4ccc-153b-08dd1b891db3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHlSNTdsTG9US1lZaTVxQXRnY3ZRVTlFSUJRVE5EYkF2WndWQ2tIU1VJNXZI?=
 =?utf-8?B?NDB0M1RQbTZxNVk3VUY4c2FkVmJyTnpWQ3dwTGY3eFVjcXFZTFNsN1Z0VUJG?=
 =?utf-8?B?UzZjc1BVZnRVMFJNMkJ3eVIrUzlmNkVsQ0g2VHByMm5aVkZ0QW5ZVVl0VkY5?=
 =?utf-8?B?UFpsRVdXQ3lIZGE0L0oyUXFLTmc1Y3RoWjlCYU9nQmRnTWlpRGpqZUZxY1pR?=
 =?utf-8?B?Ym1HbEE3NTBmdjR3c0ZWN1VYZllzR0pzOHBONlhTMkt4QlBvQjhoS3VDWldq?=
 =?utf-8?B?bXJJYUFGYlYwUlQ5czJ1MnRMY1JlY2RMdkxqTE1pVVFSNGV5Kzk3YTduaGZv?=
 =?utf-8?B?ZEtzeHpwOXZ2QjJHVXRnTUdlcmlxbDdYR2RNcGdrNVVlYzZ3SGwrdFp3VkpF?=
 =?utf-8?B?ei8wZHQrdk1DbWFVd3V6YUxlcXh2MXR5TnNvbUx3cisxaVhqOVltUjdvL08z?=
 =?utf-8?B?ekdVaWZNV09hdmRENWdUbDRQU2p0WkJVTWdOSFB0ZVpuMCsrTXAwUzE2YkNn?=
 =?utf-8?B?MzNLNFBCWjdMTW5EVC9tL2ZtSmJHTTd3K0JhNG4zWkY5Wi93cFI0WjRvL256?=
 =?utf-8?B?UlF1c1d3bGtUMEU5bHU2QU9aNGUySkczaDV2ZFpYNVpyZjZRWWlqUmJVVjhC?=
 =?utf-8?B?cmtTSU9ia1o1anhEM1R3VXFvaHJid2xCd2lVRFEwRDFvOHcwVGxmQUZXK0VW?=
 =?utf-8?B?M2ZLNW1OV2FVRFd6dXh2dHFmRkRoejdxbUJSZGdmRjc1OSthbUl6bG02WE1O?=
 =?utf-8?B?UDVxUkZhNmFmeGoyZW91Kzg5VmZHQjNrMFZubVJMUlpIWHo3elNVZlptbWdB?=
 =?utf-8?B?MzRyU1dDbjZvS3Y2dDRuWXpmM3ZPRElsT2l2UUFtaUx3RkFwcHZSRzZTRXd2?=
 =?utf-8?B?N21lNkppTXhzdklnSHhmOUVVcWg3UWxXQ2t1OVBJTWZseHRtOHU1OHp4V2tr?=
 =?utf-8?B?bDBtZmlGYmxsZ0Y3K1poaW01ZTdlRjRtMVNXemVtRWhoQkVMTEJHY0pvNWhP?=
 =?utf-8?B?MHlIcm1jY2xXWGFuZmRTN1Rpbmd6WkRvWTRjdmptNzBIRXphRCtsNmVPayts?=
 =?utf-8?B?Wkh1WjFEL2lYTTAwS09LZmlPVHMvVFF5b0dhTk8zdktudVZSaFQxaTNIYk1L?=
 =?utf-8?B?RVVZV0xzZjd0aEY3ZVM1ZXJwbVZyZFBqa1F0d2NkSDR1ZzhERlA5cEZrQjRC?=
 =?utf-8?B?UzdMa09jY3hFdzFveE5HWGcrQXBYa3NJSThXd3dvcXR1YVd3N1Rhc041QWRx?=
 =?utf-8?B?aWtFU1E4eE1NY2Zhd0MxT0J5VlBINEh4cysxR1lGQ1VBTEZBcjRYN3FsTlM3?=
 =?utf-8?B?T1NCeHZjdzEyQVB3QVR2OE5qditOeXdqT2pwN2hGWklDbmo4ZTBIbkFHcU9E?=
 =?utf-8?B?dzVEbVdKUHRocW1jd1lmTUVTVTFUanJJeERiOC9jL250YUYxMThRMDJ4OGQ0?=
 =?utf-8?B?VW84RVhReXJFbWlXTUNEQ3lmWTkzOEdwV3N3LzF2amd1V2dOVzdDdjM0dHRE?=
 =?utf-8?B?MDVyZ3l1c1NuOTlxYWZMcDJJMXExQmh5REs3T0ZhYjlZNWN1SkpXamJTNlR1?=
 =?utf-8?B?RlZTZnd0WjhkOGRMcDlJaitpTDJTNmN2VFQ5OE9VdG9TQlBaSjRPamRTMTJB?=
 =?utf-8?B?eVRWSE85T1ZHNjhrOHl6MUcvV1h0cFFFQnF5dTV3cW9pUTlINlN1cjc1RVhs?=
 =?utf-8?B?ZytPcEVxWDVSR0dvbGxudE5zRkY2dUlDdUpOV25UREY3dlo0d0xhbWpId21C?=
 =?utf-8?B?Q3ZseFA5K054eTNLSlBOSEpMNC9KZTRZQkpwWXF0bEFtc2JkbDR4UUgvcy9I?=
 =?utf-8?B?SEFWM05VaTIvSnBRMjJTMGowRHVFcUZOZ2FtUmdrUVdlS2hmWnRadXJlTDVQ?=
 =?utf-8?Q?a7B5faAgxHw4e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkUxMkd1T3ZpdWtoelhVc0FtZk1hMTJrZ1F0MDlrYWJVL3FJVkhXMWRwNFZu?=
 =?utf-8?B?TlVudU04aXFYeVpEQlpxQi9kSnVXYXoxODJQeHpNNHhXenZlQ256cXJYRTBt?=
 =?utf-8?B?dEFBdTNzbEVxS2ZCMVdCMzU5SWVzaHNNeUJLbEZEbEwyeTZxc1lFY09xRWtP?=
 =?utf-8?B?dTV2V250RDBwdG9rOGFEUTFIQk9PTldUa3JtNkRmanpOamZuVmJqT1ljV1hm?=
 =?utf-8?B?Y2x2M1kvOGZZcFZHK1psZ0h6Uno1akhHUTJSZHVWS2Y1SnNvOTdDbnQxbHBh?=
 =?utf-8?B?dmtjYU9uOTB0SGFBU3RvWkRYa0xtUDhvSW1wajJDUXRVNytsaERMS3lpMkUx?=
 =?utf-8?B?VjBrb1BDd1lFcjlBd1NyR3paNERieDdTU2s3ZTI2MWFyMm5aYzlKcFErbmE3?=
 =?utf-8?B?LytuRVczS3B5OFV6MTEzK2RaRGRncWNwQTFQYU1oUVJrS1RoUVVxc1Z3N3Vn?=
 =?utf-8?B?UXFKbXIrZWNQVVdTTGN5ekxHL2dlSXZ4VXg0WVpJU1dlN1dQbnZ4bk1mK0pI?=
 =?utf-8?B?QklWWFhvUG9WdkxFWFRyTHVJaktTTnJtZWVvZEdTYkZWNVJkZy9CYTZpdlNC?=
 =?utf-8?B?YTl4eWpmSlp6M1d2SWU1Tkxkc2U3V3RsNUFzc3dQSWNYRDdnSkZFUnZ4enc4?=
 =?utf-8?B?MUsyQjV0VVhZNjk1Z0RhNzhwTUFCemJ2dmR6ZGhkcXRLYk5NNDVxNEwzNkJl?=
 =?utf-8?B?cGJsWVgrMXFUQ3JNNlB2ZHU4eFRvdzhHalhKaVM4WnR0WDd4cllrTGsvOFNk?=
 =?utf-8?B?dTF0VnpBbDNkc3dnM3Rld3dPdjdENUhjOW53YWprNlg0Z01OZTNZNnl1TGVl?=
 =?utf-8?B?QmlxbTZwSlVYSEU1dzNURkxHdVovVUxwYmVSY0dXNE04VmhwRlQ5VGFnNDg0?=
 =?utf-8?B?Tml0eWdqMVVJMHhGNnR0WFlreG5GWE5ua3Z0Wmg1bEs2ZkVVWFg5NGpGK0or?=
 =?utf-8?B?TDh0N0tENVdYa3BmeXY3YmhNNzZtY1ZCZVpldVJLNFFXdG5rZUVQelVWak96?=
 =?utf-8?B?ZVFOVWhodExZNTNrbTJxYXNheE1NK05sRXcrSVJUYW9RQ2xWUWlkak0xSS9K?=
 =?utf-8?B?RGFjbG4rS1kwOEFMSTBXVnBzeVlxRmJVdVk4T2tya3YrZWgxaDg0TG5NZktt?=
 =?utf-8?B?RkdLbkN6UTVkeS8xZkZyaVZPQWk3WlFObFlZYWhTOERCOVh2a2gxTEtsWTIx?=
 =?utf-8?B?QkFkcE05NUY4VlY2MThDdkYweHdFbFlXYU9WSnVQV2xSOXkxK1gxRnl2T0xK?=
 =?utf-8?B?TWtEczFMSDBtQ2s0N0ZtL1VkNmgvSDk5ekJlNWI2MFZlWlpCU3lEYXZ1bVRP?=
 =?utf-8?B?a1NrS1RyeldMZUx1NFFTVkJjNHBGRFliWlZYM096dnpaV0hqQXdZcXBNWms0?=
 =?utf-8?B?ZkFoSHRBVGRkZDBaejR0dTU5ekw3NXZpckNZTWxrUDdpdDBtZFlMMll5TExR?=
 =?utf-8?B?bWNidTJWKy9INXhDc0tVWG44WnJJcUxhS1VUOFpsdGRZVnRna0dNRTNZSnEz?=
 =?utf-8?B?Mys5Q0dVbEY5YTFWaTRhSk5JSTJYOFBiaEx2bHp3d045NnpGK2ZaKzRKalpj?=
 =?utf-8?B?eDg5NEt1TFpTTTZSMGM4NkZFQnhjN1JKMWh3NUdjMThkZTZKcVFYS0hqQ3Uz?=
 =?utf-8?B?RlVNaGk3YjBUZFpZdHF5UDRBTm1ZVzE3Q2l1QUduOU9yQ0RJaHV3YURPK1RZ?=
 =?utf-8?B?a1Zlcm53TFpjcldrUVVsdHNSbzQ2Q25PUHVTa1U4MkpaelFqeVVrMTl5MDRS?=
 =?utf-8?B?SFdPVEFMNFNHQjlwNWtiQUhrLzM5NStHWUcwK3Y1b3I3cGpvalJzZFlCY29p?=
 =?utf-8?B?SFhyV1hQYTV1TXY4QlRZUFNublRyZDcwSWFCNjlhR3lyeGhJT2pRT3lCbjZT?=
 =?utf-8?B?RnJFaGIvMWNFT2RqVFRsZFRxQ0l6VUFKZ2srVEl3VFdvdUJLL0hiaVpmUC9m?=
 =?utf-8?B?M1RJaFJZb0ZSeWNxZEttVXJFOEpiaGVjZUlTNXpDMnZFTWhLb2g0VXVNbU02?=
 =?utf-8?B?SnVMajdib0JGOVdlazVrcXNQb2RTRWlCWFZNT0c4UCtIMUloR0FCMUFNMVBu?=
 =?utf-8?B?UTNCVFhabkNYWjllWDZyOVF0djNKdGczcE1jZVpTaGtVeWhpTFBOOUlzWFVR?=
 =?utf-8?B?VGdiRTU3aUlxaitTK0EyVE1zdklOV3ExSGloMHpueVlCK3QvRUFMd2JtOG5s?=
 =?utf-8?B?NGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: TPQ/o4I8a16iJupjMMt3+EcahwbhSBl1attjn3XIvnC9/qwAgeJc0OGUlsU9s7kwJZrBJwjFX0Tr8P6qapX1vfGhIgx3JDjPqiSfEeGFbmVtXjzYuvCtClbvmk1xJdpMCsXaZlTLvzAFtRDCjiw+Qxb0v3Pb2ZHZupxxnVGkDMjFluOVqebj0XMNIM/qFvtSaWev5xMejXSTKu4wfMQQb1PCpR8J2axHCeiNRbFtEKdb+OfrWR7rien9Y3Wyf6oZOortYyKmupbqFM+lzeIl6C2Zyw3VV9wgoyR9TpBc1rLk4tGx8g3P3kAZaahvcPb088BCxAUGvmiW9EAIL/6ZW3XAMU7rVkrb0+lPpIH7EMRi3eIzkk46AemibJh4koEqXcvlG4utnEYORddWV5IDtHzxZ80QsGpw93xJlOLrczcMYcMsJZhYB0U39JY6fUG9Fc35Cojf5IxaE3lnGBomwbarodsFMSZrZuO8/qYTM5tZEaQwktnURpmXCk8bCdywFWRZ+5ErrJl/tyj94b01eTKDjePzphmnFnKnbaiDcW2c+z+3I6jjzq2f6+eadvgbPmUG7dt2KaiCKGLDWtjceqF2EN/nq4v6uJeMXyavY58=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a139600-7006-4ccc-153b-08dd1b891db3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 15:16:28.2058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHOT3CtpasFu5LPpzrUGqvLEvhOiENUXIPZ94+g1lFZNyBP22D38/SpVE6f14YrBX9FerilcZahQCfoOEUXvQmdC0UiLKus+9cLB9Tue/g8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7327
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-13_06,2024-12-12_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412130108
X-Proofpoint-GUID: Zb1VRrOwpvVqBlcnZc9VixKZF4E6txUD
X-Proofpoint-ORIG-GUID: Zb1VRrOwpvVqBlcnZc9VixKZF4E6txUD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_071715_112343_91BBD00C 
X-CRM114-Status: GOOD (  26.62  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBEZWMgMTMsIDIwMjQgYXQgMTA6MDY6NTVBTSAtMDUwMCwgS2FsZXNoIFNpbmdoIHdy
b3RlOgo+IE9uIEZyaSwgRGVjIDEzLCAyMDI0IGF0IDQ6MDDigK9BTSBMb3JlbnpvIFN0b2FrZXMK
PiA8bG9yZW56by5zdG9ha2VzQG9yYWNsZS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgRGVj
IDEyLCAyMDI0IGF0IDA1OjM2OjA5UE0gLTA4MDAsIEFuZHJldyBNb3J0b24gd3JvdGU6Cj4gPiA+
IE9uIFRodSwgMTIgRGVjIDIwMjQgMjI6NTE6MzQgKzAwMDAgTG9yZW56byBTdG9ha2VzIDxsb3Jl
bnpvLnN0b2FrZXNAb3JhY2xlLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+ID4gWW91J3ZlIGZ1bmRh
bWVudGFsbHkgdmlvbGF0ZWQga2VybmVsIHByb2Nlc3MgYW5kIGV0aXF1ZXR0ZS4gSSdkIGJlIG1v
cmUKPiA+ID4gPiBmb3JnaXZpbmcsIGJ1dCB0aGlzIGlzIGF0IHYyIGFuZCB5b3UndmUgbm90IGNj
J2QgS0VZIHBlb3BsZS4gVHdpY2UuIFRoaXMgaXMKPiA+ID4gPiB0b3RhbGx5IHVuYWNjZXB0YWJs
ZS4gU2VlIFswXSBpZiB5b3UgYXJlIHVuc3VyZSBvZiBob3cgdG8gZG8gc28uCj4gPiA+Cj4gPiA+
IFRoaXMgZmVlbHMgZXhjZXNzaXZlIHRvIG1lLiAgbGludXgtbW0gYXZlcmFnZXMgYSBtZXJlIDE0
MCBtZXNhZ2VzL2RheQo+ID4gPiBhbmQgaXQgc2VlbXMgcmVhc29uYWJsZSB0byBhc3N1bWUgdGhh
dCBrZXkgcGVvcGxlIGFyZSBzcGVuZGluZyB0aGVpciA1Cj4gPiA+IG1pbnV0ZXMgdG8gc2Nyb2xs
IHRocm91Z2ggdGhlIGVtYWlsIHN1YmplY3RzLgo+ID4KPiA+IEluIHByYWN0aWNlIHdlIGRpZCBh
bGwgbWlzcyBpdCwgYW5kIEkgZG9uJ3QgdGhpbmsgaXQncyB1bnJlYXNvbmFibGUgdG8gYXNrCj4g
PiBwZW9wbGUgdG8gcnVuIGdldF9tYWludGFpbmVycy5wbCB0byBhdm9pZCB0aGlzLgo+ID4KPiA+
IEluIGFueSBjYXNlLCBJIHRydWx5IGRvIHRoaW5rIHRoaXMgc2VyaWVzIHdvcmtzIGJldHRlciBh
cyBSRkMsIEkgbWVhbiBMaWFtCj4gPiBoYXMgYWxyZWFkeSB2b2ljZWQgdGhlIGtpbmQgb2YgZGlz
YWdyZWVtZW50cyBJIHNoYXJlIHdpdGggaXQsIGFuZCB3ZSBuZWVkCj4gPiB0byByZXRoaW5rIGhv
dyB0byBhcHByb2FjaCBpdCBpbiBnZW5lcmFsLgo+ID4KPiA+IFNvIGlmIHRoaXMgaXMgc2ltcGx5
IHNlbnQgYXMgUkZDIHdpdGggdGhlIGNvcnJlY3QgY2MncyAoYW5kIGlkZWFsbHkgd2l0aAo+ID4g
c29tZSByZXZpZXcgZmVlZGJhY2sgYXBwbGllZCAtIGEgYmV0dGVyIGNvdmVyIGxldHRlciwgZXRj
LikgdGhlbiBpdCBtYWtlcwo+ID4gZXZlcnl0aGluZyBlYXNpZXIuCj4gPgo+ID4gQXMgbWVudGlv
bmVkIHRoZSB0aW1pbmcgaXMgdW5mb3J0dW5hdGUgaGVyZSwgdGhpcyBpcyBhIHNlcmllcyB3ZSBy
ZWFsbHkKPiA+IHdhbnQgdG8gbWFrZSBzdXJlIGlzIHByb3Blcmx5IHJldmlld2VkIGJlZm9yZSBh
bnkgY2hhbmNlIG9mIG1lcmdlIHNvIGFnYWluCj4gPiB0aGlzIHBvaW50cyB0byBSRkMgYmVpbmcg
dGhlIHdheSBmb3J3YXJkLgo+Cj4gSGkgZXZlcnlvbmUsCj4KPiBTb3JyeSBmb3IgdGhlIGRlbGF5
ZWQgcmVzcG9uc2UgLS0gSSB3YXMgdHJhdmVsaW5nIGFuZCBkaWRu4oCZdCBoYXZlCj4gYWNjZXNz
IHRvIGVtYWlsLgoKQWNrLgoKPgo+IFRoYW5rIHlvdSBmb3IgdGhlIGZlZWRiYWNrLiBJIHJlYWxp
emUgSSBtaXNzZWQgc29tZSBrZXkgcmV2aWV3ZXJzIGluCj4gdGhlIENDIGxpc3QgZm9yIHRoaXMg
cGF0Y2guCj4gV2hlbiBJIHJhbiBnZXRfbWFpbnRhaW5lci5wbCwgaXQgcmV0dXJuZWQgYSBsYXJn
ZSBsaXN0IG9mIHJlY2lwaWVudHMuCj4gVG8gYXZvaWQgb3Zlci1DQ+KAmWluZyBwZW9wbGUgKHdo
aWNoIGhhcyBiZWVuIGFuIGlzc3VlIGZvciBtZSBpbiB0aGUKPiBwYXN0KSwgSSB0cmllZCB0byB0
cmltIGl0IGRvd24gdG8gbWFpbnRhaW5lcnMgYW5kIGEgZmV3IG90aGVycyBJCj4gdGhvdWdodCB3
b3VsZCBiZSBpbnRlcmVzdGVkLiBDbGVhcmx5LCBJIGdvdCBpdCB3cm9uZyBhbmQgbWlzc2VkIHNv
bWUKPiBrZXkgZm9sa3MuIFRoYXQgd2FzIG5vdCBteSBpbnRlbnRpb24sIGFuZCBJ4oCZbGwgbWFr
ZSBzdXJlIHRvIGZpeCBpdAo+IHdoZW4gSSByZXNlbmQgdGhlIHBhdGNoIGFzIGFuIFJGQy4KClN1
cmUgdGhhbmtzIDopIE11Y2ggYXBwcmVjaWF0ZWQuIFNvcnJ5IHRvIGJlIHNvIGN1cnQgdGhlcmUs
IGp1c3QgSSB0aGluawppbXBvcnRhbnQgdG8gdW5kZXJsaW5lLgoKV2UganVzdCB3YW50IHRvIG1h
a2Ugc3VyZSB3ZSBjYW4gZmluZCBhIHdheSB0byBnZXQgdGhpcyBzZXJpZXMgc29ydGVkIG91dApz
byB3ZSBjYW4gZ2V0IGl0IG1lcmdlZCBpbiBhIGZvcm0gdGhhdCBtYWtlcyBzZW5zZSBvdmVyYWxs
LCB1bHRpbWF0ZWx5ISA6KQoKPgo+IE9uIHRoZSB0ZWNobmljYWwgc2lkZSwgTGlhbSBpcyByaWdo
dCB0aGF0IHRoZSBjb3B5LXBhc3RlZCBhcmNoIGNvZGUKPiBoYXMgaW5jb25zaXN0ZW5jaWVzICht
aXNzaW5nIGNoZWNrcywgb3JkZXIgb2YgY2hlY2tzLCAuLi4pLiBJIGFncmVlCj4gdGhlcmXigJlz
IHJvb20gZm9yIGZ1cnRoZXIgY29uc29saWRhdGlvbi4gSeKAmWxsIHRha2UgYW5vdGhlciBzdGFi
IGF0IGl0Cj4gYW5kIHJlc2VuZCBpdCBhcyBhbiBSRkMgd2l0aCBhbiB1cGRhdGVkIGNvdmVyIGxl
dHRlciwgYXMgTG9yZW56byBhbmQKPiBvdGhlcnMgc3VnZ2VzdGVkLgoKVGhlIG1vc3QgdXNlZnVs
IHRoaW5nIGhlcmUgYXMgd2VsbCB0byBoZWxwIHVzIHVuZGVyc3RhbmQgd291bGQgYmUgdG8gd3Jp
dGUKbW9yZSBpbiB0aGUgY292ZXIgbGV0dGVyIHRvIGV4cGFuZCBvbiB3aGF0IGl0IGlzIHlvdSB1
bHRpbWF0ZWx5IHdoYXQgdG8KYWNoaWV2ZSBoZXJlIC0gaXQgc2VlbXMgbGlrZSBhbiBleHRlbnNp
b24gb24gdGhlIGV4aXN0aW5nIFRIUCB3b3JrIG9uIGEKcGVyLWFyY2ggYmFzaXMgKEkgbWF5IGJl
IHdyb25nKT8gU28gYWRkaW5nIG1vcmUgZGV0YWlsIHdvdWxkIGJlIHN1cGVyCnVzZWZ1bCBoZXJl
ISA6KQoKV2UgZG8gaG9wZSB0byBhdm9pZCBhcmNoIGhvb2tzIGlmIGF0IGFsbCBwb3NzaWJsZSBl
eHBsaWNpdGx5IGZvciB0aGUgcmVhc29uCnRoYXQgdGhleSBjYW4gYmUgYXBwbGllZCBhdCB1bmZv
cnR1bmF0ZSB0aW1lcyBpbiB0ZXJtcyBvZiBsb2NraW5nL3doZXRoZXIKdGhlIG9iamVjdHMgaW4g
cXVlc3Rpb24gYXJlIGZ1bGx5L3BhcnRpYWxseSBpbnN0YW50aWF0ZWQsIFZNQSB2aXNpYmlsaXR5
CmV0Yy4gZXRjLiBiYXNlZCBvbiBoYXZpbmcgaGFkIGlzc3VlcyBpbiB0aGVzZSBhcmVhcyBiZWZv
cmUuCgpBbHNvIGlmIGEgaG9vayBtZWFucyAnYW55dGhpbmcnIGNhbiBoYXBwZW4gYXQgYSBjZXJ0
YWluIHBvaW50LCBpdCBtZWFucyB3ZQpjYW4ndCBtYWtlIGFueSBhc3N1bXB0aW9ucyBhYm91dCB3
aGF0IGhhcy9oYXNuJ3QgYW5kIGhhdmUgdG8gYWNjb3VudCBmb3IKYW55dGhpbmcgd2hpY2ggc2Vy
aW91c2x5IGNvbXBsaWNhdGVzIHRoaW5ncy4KCklkZWFsbHkgd2UnZCBmaW5kIGEgbWVhbnMgdG8g
YWNoaWV2ZSB0aGUgc2FtZSB0aGluZyB3aGlsZSBhbHNvIGV4cG9zaW5nIHVzCmFzIGxpdHRsZSBh
cyBwb3NzaWJsZSB0byB3aGF0IG1heSBiZSBtdXRhdGVkLgoKPgo+IFRoYW5rcywKPiBLYWxlc2gK
ClRoYW5rcyEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
c25wcy1hcmMK
